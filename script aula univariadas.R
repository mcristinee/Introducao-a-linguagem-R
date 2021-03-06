##Fun��es importantes
#
version
#informa��es detalhadas sobre a vers�o do R que voc� est� usando
#
sessionInfo(package = "multcomp")
#Informa��es sobre a vers�o do R, o sistema operacional e pacotes carregados

#
library(sciplot)
citation("sciplot")
#mostra como citar o R e seus pacotes

#Instalar e carregar pacotes importantes
library(tidyverse)

#install.packages("multcomp")
#install.packages("MASS")
#install.packages("lme4")
#install.packages("car")
#install.packages("dplyr")
#install.packages("rstatix") 
#install.packages("ggplot2")
#install.packages("nlme")
#install.packages("lme4")
#install.packages("GAD")
#install.packages("ez") 
#install.packages("reshape") 


library(multcomp)
library(MASS)
library(lme4)
library(car)
library(dplyr)
library(rstatix) 
library(nlme)
library(lme4)
library(GAD)
library(ez)
library(reshape) 
library(tidyverse)
#ANOVA DE 1 FATOR

#Abundancia de marinha farinha em diferentes praias

#Importar os dados
data <- read.table("mariafarinha.txt", header = T, sep= "")
data

#NOMEAR OBJETOS
abundancia<-data$abundancia
praia<-data$praia

#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
is.factor(praia)
is.numeric(abundancia)

#Cria modelo(variavel resposta ~ variavel categorica)

anova1 <- aov(abundancia ~ as.factor(praia), data=data)

#testar pressupostos
par(mfrow= c(2,2))
plot(anova1)

leveneTest(abundancia~praia)
bartlett.test(abundancia~praia)


#Pressupostos est�o ok?


#Fiquei na duvida se deu normalidade

shapiro.test(anova1$residuals)
#p>0,05 = normalidade dos dados

#Fiquei na duvida se deu homocedasticidade
leveneTest(anova1)
#p>0,05 = homogeneidade de variancias

#Olhar o resultado do modelo
summary(anova1)

#Diferen�a entre os n�veis do tratamento
#Mas qual n�vel? --> teste a posteriori

TukeyHSD(anova1)

#resultado: todas as prais s�o diferentes entre si

#-----------------------------------------------------------------------------
#ANOVA DE 2 FATORES

#Efeito da temperatura de do pH No consumo de algas pelo caranguejo Pachygrapsus transversus
rm(list=ls())
#IMPORTAR DADOS
data <- read.table("alimentacao.txt", header = T, sep= "")
data

#NOMEAR OBJETOS
data$temperatura<-as.factor(data$temperatura)
temperatura <- data$temperatura
consumo<-data$consumo
data$ph<-as.factor(data$ph)
ph<-data$ph

#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
#Dica: variavel categ�rica --> usar uma letra
is.factor(temperatura)
is.numeric(consumo)
is.factor(ph)

#Criar modelo(variavel resposta ~ variavel categorica1 + variavel categorica2 + categorica1*catergorica2))

anova2 <- aov(consumo ~ temperatura + ph + temperatura*ph, data=data)

#Testar pressupostos
par(mfrow= c(2,2))
plot(anova2)

#Pressupostos est�o ok?

#TRANSFORMAR OS DADOS
analise3 <- aov(log(consumo) ~ temperatura + ph + temperatura*ph, data=data)
par(mfrow= c(2,2))
plot(analise3)

#agora os dados est�o ajustados


summary(analise3)

#deu significativo para temperatura e pH
#teste a posteriori para encontrar as diferen�as

TukeyHSD(analise3)

#OU podemos fazer anova usando um modelo linear
#indicado para quando voc� quer usar um SS especifico
#carregar o pacote car

library(car)

analise4 <- lm(log(consumo) ~ temperatura + ph + temperatura*ph, data=data,contrasts=list(temperatura=contr.sum,
ph=contr.sum))

Anova(analise4, type="III")

##Se j� estiverem dominando o R, pode fazer tudo em uma linha de comando s�
#Eu gosto de separar para ser mais f�cil verificar poss�veis erros

Anova(lm(log(consumo) ~ temperatura + ph + temperatura*ph, data=data,contrasts=list(temperatura=contr.sum,
ph=contr.sum)), type="III")

#---------------------------------------------------------------------
#ANOVA DE MEDIDAS REPETIDAS


#Crescimento de plantas ao longo do tempo sob alta e baixa luminosidade

#Importar os dados
rm(list=ls())
data <- read.table("repeatedmeasures.txt", header = T, sep= "")
data
View(data)

data$ID<-as.factor(data$ID)
ID <- data$ID
tempo1<-data$tempo1
tempo2<-data$tempo2
tempo3<-data$tempo3

#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
is.numeric(tempo1)
is.numeric(tempo2)
is.numeric(tempo3)
is.factor(ID)


#Alterar o formato do banco de dados de "wide" para "long" 
library(reshape)

datalong <- melt(data, id = "ID", measured = c("tempo1", "tempo2", "tempo3"))

View(datalong)

# Renomeando as colunas do novo banco
colnames(datalong) = c("ID", "Tempo", "Biomassa")
View(datalong)

glimpse(datalong)
#Considera biomassa como inteiro -->ok
#Considera o tempo como factor -> ok
#Considera ID como inteiro (numerico), mas n�o �


# Transformando a vari�vel ID em fator
datalong$ID <- factor(datalong$ID)

#Olhar a estrutura dos dados denovo
glimpse(datalong)

##Checar pressupostos
library(rstatix)
# %>% � um operador do R

#Verificando a presen�a de outliers por grupo
datalong %>% group_by(Tempo) %>% 
  identify_outliers(Biomassa)

#Nao existe outliers em nenhuma linha --> pressuposto ok!

# Verificando a normalidade por grupo
datalong %>% group_by(Tempo) %>% 
  shapiro_test(Biomassa)

#o pressuposto de esfericidade � testado dentro do modelo de anova com medidas repetidas
#se voce usar o pacote "ez" --> Teste de Mauchly's

#Montar o modelo de Anova de Medidas Repetidas
library(ez)
anovarepetida <- ezANOVA(data = datalong,
                     dv = Biomassa,
                     wid = ID,
                     within = Tempo,
                     detailed = TRUE,
                     type = 3)

# dv = vari�vel dependente
# wid = vari�vel de identifica��o do sujeito
# within = within subjects= vari�vel independente de medidas repetidas
# type = tipo da soma dos quadrados (default � o tipo II)
#detailed = libera um resultado mais completo

#Pedir resultado do modelo
anovarepetida

#Teste de Mauchly's
#Ho-dados s�o esf�ricos
#H1-dados n�o s�o esfericos
#lembrar que a Anova de medidas repetidas tem um pressuposto de dados esf�ricos

#p � significativo, portante a hipotese nula foi rejeitada e nossos dados nao s�o esf�ricos
#nesse caso precisamos corrigir usando Greenhouse-Geisser (GGe) e Huynh-Feldt (HFe)
#a diferen�a � o tanto conservador s�o essas corre��es: GGe � mais conservador
#olhar os indices GGe e HFe, e ver o valor de p de cada um
#se p<0,05, � significativo e tem efeito do tempo
#pelo menos um dos tempo � diferente --> teste a posteriori

pairwise.t.test(datalong$Biomassa, datalong$Tempo, paired = TRUE,
                p.adjust.method = "bonferroni")

#usar o help da fun��o p.adjust.method para escolher as op��es de corre��o
help(p.adjust)

#cruzar a primeira linha com as duas colunas para ver as compara��es pareadas

#An�lise descritiva dos dados (pacote: rstatix)
datalong %>% group_by(Tempo) %>% 
  get_summary_stats(Biomassa, type = "mean_sd")


boxplot(Biomassa ~ Tempo, data = datalong, ylab = "Biomassa", xlab = "Tempo")

#--------------------------------------------------------------------
#ANOVA COM MODELO MISTO (FATOR FIXO E FATOR ALEATORIO)

rm(list=ls())
misto <- read.table("pontoaleatorio.txt", header = T, sep = "")
misto

#Analisar a estrutura dos dados
glimpse(misto)

#Nomear objetos
ponto<-as.factor(misto$ponto)
altura<-as.factor(misto$altura)
pesoalga<-misto$pesoalga

##pressupostos
#testar somente entre v�riavel resposta e fator fixo, n�o entra fator aleatorio

fit2 <- aov(pesoalga ~ altura)
par(mfrow = c(2,2))
plot(fit2)

##Montar modelo com fator fixo e aleatorio
#usando a fun��o aov

fit <- aov(pesoalga ~ altura + Error(ponto))
summary(fit)

#observe que usando aov, ele nao fornece um valor de p para o fator aleatorio
#n�o � fator de interesse
#alternativa1: montar o modelo com 2 fatores fixos e recalcular o F e o p
#alternativa2: montar modelo com fator fixo e aleatorio e comparar com um modelo de fator fixo s�
#nesse caso � possivel testar se o fator aleat�rio � significativo, mas n�o tem o p


#Note que o efeito principal de Tratamento n�o � significativo
#portanto, n�o faz sentido teste a posteriori
#vamos fazer para aprender
summary(fit, split = list(altura = list('mesoinfra vs mesomesmo' = 0, 'mesoinfra vs mesosupra' = 1, 'mesomesmo vs mesosupra' = 2)))

#Outra forma de fazer: usando a fun��o lm e o pacote GAD
library(GAD)

altura<-as.fixed(altura)

ponto<-as.random(ponto)

modelo<-lm(pesoalga~altura+ponto + altura*ponto)
gad(modelo)

#-----------------------------------------------------------------------
#ANCOVA

#A abund�ncia de anf�podes � influenciado pela identidade da alga e pela temperatura


##Importar os dados
rm(list=ls())
ancova <- read.table("anf.txt", header = T, sep= "", as.is=T)
ancova
str(ancova)
ancova$Alga = as.factor(ancova$Alga)

#NOMEAR OBJETOS
Alga<-ancova$Alga
Anfipode<-ancova$Anfipode
temperatura<-ancova$temperatura

#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
#Dica: variavel categ�rica --> usar uma letra
class(Alga)
is.factor(Alga)
is.numeric(Anfipode)
is.numeric(temperatura)

#Cria modelo(variavel resposta ~ variavel categorica + variavel continua + categorica*continua)

ancova1 <- aov(Anfipode ~ Alga + temperatura + Alga*temperatura, data=ancova)

##Pressupostos

#1)Normalidade e homocedasticidade
par(mfrow= c(2,2))
plot(ancova1)

shapiro.test(resid(ancova1))

#2)Independencia entre variavel independente e a co variavel 
#criar um modelo apenas com elas
mod_cov <- aov(temperatura ~ Alga, data = ancova)
summary(mod_cov)
#p>0,05 aceitamos a hipotese nula: n�o existe efeito da variavel independente pela co-variavel

#2)Verificar se a rela��o entre a covari�vel e a VD � linear (VD ~ cov)
library(ggplot2) 

interaction.plot(temperatura, Alga, Anfipode, data = ancova )
ggplot(data = ancova, aes(x = temperatura, y = Anfipode, group = Alga,
                         color = Alga)) +
  geom_point(size = 2) +
  xlab("Temperatura") +
  ylab("Anfipode") +   
  geom_smooth(method = "lm", se = F, size = 0.5)

#s�o 3 retas= rela��es lineares


#3)Verificar se o efeito da covari�vel � o mesmo para todos n�veis da VI (VD ~ VI*cov)
# Pressuposto: "homogeneidade dos par�metros de regress�o"
# Compara as inclina��es das retas para cada grupo da VI

mod_int <- aov(Anfipode ~ Alga*temperatura, data = ancova)
summary(mod_int)

#Nesse caso, o que importa � s� olhar a intera��o
#Se a intera��o n�o significativa --> aceito H0: homogeneidade dos parametros da regress�o

#4)Montar o modelo da Ancova, usando SS do tipo"I"
#variavel resposta ~ co-vari�vel + variavel dependente + co variavel*variavel dependente
#Obrigat�rio a co-vari�vel vir primeiro no modelo
ancova1 <- aov(Anfipode ~ temperatura + Alga + Alga*temperatura, data=ancova)
summary(ancova1)

#O que � significativo?
#E se eu esquecer disso? rodar novamente o teste e comparar o resultado
ancova2 <- aov(Anfipode ~ Alga + temperatura + Alga*temperatura, data=ancova)
summary(ancova2)


#Modelo de Ancova, usando o  SS do tipo"III" e comparar

ancova3 <- aov(Anfipode ~ Alga + temperatura + Alga*temperatura, contrasts=list(Alga=contr.sum),data=ancova)
Anova(ancova3, type="III")

#Reparem que usamos o contraste s� para Alga e n�o para temperatura. Por que?
#

#Efeito apenas do fator Alga
#Teste a posteriori
library(multcomp)

posthoc <- glht(ancova3, linfct = mcp(Alga = "Tukey"))
summary(posthoc)

#Resultado: Sargassum � diferente de Padina e Dichotomaria

#Se tivesse efeito da temperatura: variavel resposta continua x co variavel continua

posthoc2 <- lm(Anfipode ~ temperatura, data=ancova)
summary(posthoc2)

plot(temperatura,Anfipode, xlab= "Temperatura(�C)", ylab = "Anfipode")
abline(posthoc2, col ="green")

------------------------------------------------------------------------------
#GLM
#An�lisar o efeito da temperatura e do tempo sobre a quantidade de carbono na alga

#Importar dados
rm(list=ls())
data <- read.table("analisealgas.txt", header = T, sep= "")
data

#Nomear objetos
temp<-as.factor(data$temp)
time<-as.factor(data$time)
Carbono<-data$Carbono

#Verificar se o R entendeu
is.factor(temp)
is.factor(time)
is.numeric(Carbono)

#Montar modelo
#Escolher familia da distribui��o --> quasibinomial (dados de propor��o)

carb <- glm(Carbono ~ time + temp + time*temp, family=quasibinomial)
summary(carb)

#olhar a dispers�o dos dados --> menor que 1, n�o tem overdispersion
anova(carb, test= "Chisq")

#resultado: n�o tem efeito da intera��o
#vamos usar a fun��o drop1 para ver se a ordem importa

drop1(carb, test= "Chisq")

#a intera��o n�o deu significativo, vou tirar do modelo
#montar o modelo reduzido

carb.1 <- glm(Carbono ~ time + temp, family=quasibinomial, data=data)
summary(carb.1)
anova(carb.1, test= "Chisq")

drop1(carb.1, test= "Chisq")

anova(M3, M4,test="Chi")
#compara��o entre modelos mostrou que n�o tem diferen�a -> usar modelo reduzido


#teste a posteriori para cada fator separadamente
 
resultado <- glht(carb.1, linfct = mcp(time = "Tukey"))
summary(resultado)

resultado2 <- glht(carb.1, linfct = mcp(temp = "Tukey"))
summary(resultado2)

###OUTRO EXEMPLO
#A abundancia de gastropoda � influenciada pela identidade da alga e pela temperatura
##gastropoda

data<- read.table("fauna2.txt", header=T, sep= "")
data

Data <- data$Data
Alga <- data$Alga
Gastropoda <- data$Gastropoda
temperatura <- data$temperatura

is.factor(Data)
is.factor(Alga)
is.numeric(temperatura)
is.numeric(Gastropoda)

M3 <- glm(Gastropoda ~ Alga + temperatura + Alga*temperatura, family=quasipoisson(),data=data)
summary(M3)
anova(M3, test = "F")
drop1(M3, test= "F") 

#n�o deu signiticativo para intera��o
#o drop1 mostrou que a intera��o n�o � importante -> retirar a intera��o

M4 <- glm(Gastropoda ~ Alga + temperatura, family=quasipoisson(),data=data)
summary(M4)
anova(M4, test = "F")
#efeito da temperatura apenas

anova(M3, M4,test="Chi")
#compara��o entre modelos mostrou que n�o tem diferen�a -> usar modelo reduzido


#regress�o entre densidade de gastropode e temperatura

M4.1 <- glm(Gastropoda ~ temperatura, family=quasipoisson(), data = data)
anova(M4.1, test ="F")
summary(M4.1)

#########################################
#Exerc�cios

#1) Anova de 1 fator
#Usar a planilha Iris
#Verificar se o comprimento da p�tala (Sepal.Lenght) e o comprimento da s�pala (Sepal.Lenght) varia entre as esp�cies
#Fazer separadamente para p�talas e s�palas
#Se tiver diferen�as, fazer o teste a posteriori de Tukey
rm(list=ls())

comprimento = aov(log(iris$Petal.Length)~iris$Species)
comprimento
par(mfrow=c(2,2))
plot(comprimento)
TukeyHSD(comprimento)

iris
comprimento_petala<-iris$Petal.Length
comprimento_sepala<-iris$Sepal.Length
especies<-iris$Species
#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
is.factor(especies)
is.numeric(comprimento_petala)
is.numeric(comprimento_sepala)

anova1 <- aov(comprimento_petala ~ especies, data=iris)
summary(anova1)
#2)Usar a planilha fauna2
#A abundancia de anf�pode � influenciada pela "Data" e pela "Alga"?

#Analise de vari�ncia (Varivel resposta ~ fator1*fator2)
fauna <- read.table("fauna2.txt", header=T)
head(fauna)
str(fauna)

Anf = fauna$Anfipode
Alga = as.factor(fauna$Alga)
Data = as.factor(fauna$Data)

anova2 <- aov(log(fauna$Anfipode+1)~as.factor(fauna$Data)*as.factor(fauna$Alga))
plot(anova2)


modelo1 <- glm(fauna$Anfipode+1~as.factor(fauna$Data)*as.factor(fauna$Alga), family=quasipoisson())
anova(modelo1)

anova(modelo1, test = "F")

AlgaData = interaction(Alga,Data, drop = T)

modelo2 = glm(Anf ~ AlgaData,family = quasipoisson())
resultado = glht(modelo2, linfct  = mcp(AlgaData = "Tukey"))
summary(resultado)

#3) Aprendendo sobre a import�ncia dos pressupostos
# Usar a planilha riqueza
#Efeito do tempo de sucess�o e da condi��o (tratamento) na riqueza da fauna
#Anova de 2 fatores: �tempo� e �condi��o�
#Como est�o os pressupostos?
#Fazer o teste sem transformar os dados
#Qual o resultado?
#E se eu transformar? como transformar?
#E se usar glm?
#Qual familia vou usar?


