## Manhã - Aula 1

#Nesta primeira parte iremos entender o que o R Faz.


#Ele pode funcionar como uma calculadora comum. Por exemplo:
3+4

4+19-7*8
22-13.3
30 - 14.3
3*8
16/4


#Conseguimos tambem fazer a raiz-quadrada, mas precisamos usar uma funçao.
sqrt(9)

sqrt(81)

sqrt(2)

log(10)

# Podemos calcular potencias

2^3
12^8

# Logaritimos tambem sao facilmente calculados
log(200)
log10(100)
log2(20)

## Media e Desvio Padrao
median(c(12,14,15,16,19))
mean(c(12,14,15,16,19))
sd(c(12,14,15,16,19))

#Todos esses calculos apareceram no terminal. Mas e se eu quiser armazenar em algum lugar pra usar depois em outro calculo?
#Entao eu uso um 'objeto' ou como chamado no R um vetor. 

ourico = c(12,14,15,16,19)
Michelle <- c(1,2,3,4,5)

ourico

mean(ourico)


a = 10
b = 12
a


# Eu tambem posso armazenar texto
c = "Terra"
d = "Quarentena"
c

# Os vetores podem ter diferentes classes. Numerica, Caracter, numero inteiro

class(a)
class(c)


#Eu posso realizar facilmente uma operacao com vetores
a + b
b * a
a + e
e = "12,5"

# Posso tambem armazenar mais que 1 dado nesse vetor.
# Mas preciso utilizar a funcao concatenar 'c()'.
vetor1 = c(2,3,4,5,6,7) 

vetor2 = c(10,9)

length(vetor1)
length(vetor2)

vetor2 - vetor1

# Podemos criar sequencias aqui no R.

vetor3 <- seq(from = 1, to = 2, length.out = 6)
vetor3

vetor4 = seq(from = 0, to = 2.5, by = 0.5)
vetor4

# Podemos repetir algum item tambem

vetor5 = rep("verao", 6)
vetor5
class(vetor5)

estacao <- rep(c("verao", "inverno"),each = 3)
estacao

#Podemos informar a distribuicao e pedir que o R gere numeros aleatorios

vetor7 = runif(6,12,14) # argumentos da função (n, inicio, final)
vetor7
vetor8 = rnorm(6,15,2) # argumentos da função (n, media, desvio padrao)
mean(vetor8)
sd(vetor8)

###Funcao - SAMPLE.
vetor9 = sample(10,6, replace = F)
vetor9

# Aqui podemos tambem criar uma "Planilha" que no R eh chamada de Data.frame
planilha = data.frame (vetor1, vetor2, vetor3, vetor4, vetor5, estacao,vetor7,vetor8,vetor9)


planilha


#data.frames aceitam mais de 1 classe de vetor. Matrizes nao aceitam.

# MATRIZ
matriz = as.matrix(planilha)

matriz
str(matriz)

#Qual o Problema?
#Oq houve?

#Vamos utilizar o nosso objeto planilha pra manipular data frames. 
# podemos selecionar dados de uma coluna chamando o objeto, colocando um $ e o nome da coluna. 

planilha$vetor7

planilha$estacao


uniforme = planilha$vetor7
mean(planilha$vetor7)
mean(uniforme)

#Outra forma de selecionar eh atraves de indexacao. Onde colocamos [,] apos o nome do nosso objeto
# planilha[linhas,colunas]

planilha[,]

planilha[,5] # Pegamos a 5 coluna inteira

planilha[-3,] # Removemos 3 linha inteira

numerico = planilha[,-c(5,6)] # Remover colunas
numerico
matriz = as.matrix(numerico)
matriz

max(uniforme)
min(uniforme)

planilha [3,7] # pegamos o valor que esta na linha 3 e coluna 4. 

# Agora usaremos os dados da planilha Iris no exemplo.

head(iris) # Essa funcao nos mostra as 5 primeiras linhas da planilha
iris
str(iris) # essa funcao nos mostra a estrutura da planilha, ou seja, a classe de cada uma das variaveis. 

# Entao vamos comecar a Manipular a planilha. Digamos que eu queira saber a media da largura das petalas para cada especie. 
# COMO FACO ISSO?
#Utilizo a funcao aggregate
aggregate(iris$Petal.Length~iris$Species, FUN = mean)

head(planilha)
est = as.factor(planilha$estacao)
aggregate(planilha$vetor8~as.factor(planilha$estacao), FUN = mean)

# EU posso armazenar essa informacao?
(petala_largura_media = aggregate(iris$Petal.Width~iris$Species, FUN = mean))
petala_largura_media

#Vamos trocar o nome das colunas pra nao confundir 
colnames(petala_largura_media) <-  c("especie", "largura_media")
petala_largura_media

# VAmos adicionar tambem o desvio padrao nesse nosso data frame. 
petala_largura_desvpad = aggregate(iris$Petal.Width~iris$Species, FUN = sd)
colnames(petala_largura_desvpad) = c("especie","desvpad")
petala_largura_desvpad


petala_largura_media$desvpad = petala_largura_desvpad$desvpad #coloquei a coluna desvio padrao
petala_largura_media


#Exercicio 1
# Crie um vetor com 40 numeros de 22 a 62.
n40 = seq(from = 22, to = 62, length.out = 40)
n40

length(n40)
min(n40)
max(n40)


#Exercicio 2
# Crie um vetor N = 40 com as palavras Verao e Inverno 
(Vetor16 = rep(c("verao", "inverno"), each = 20))

(aleatorio = sample(c("verao","inverno"), 40, replace = T))

table(aleatorio)

length(Vetor16)

#Exercicio 3
# Crie um data.frame com 4 variaveis, 1 categorica, 3 continuas.
## Com N = 40.
sexo= as.factor(rep(c("feminino","masculino"), c(12,28)))
cat = as.factor(rep(c(1,2,3,4,5), 8))
table(sexo)
cont1 = seq(15,20, length.out = 40)
cont2 = rnorm(40, 8, 1)
cont3 = runif(40,24,64)
length(cat)

exercicio3 = data.frame(cat,sexo,cont1,cont2,cont3)
str(exercicio3)

#Exercicio 4
#Calcule a media e o desvio padrao para cada uma das variaveis. 
mean(exercicio3$cont1)
mean(exercicio3$cont2)
mean(exercicio3$cont3)
sd(exercicio3$cont1)
sd(exercicio3$cont2)
sd(exercicio3$cont3)


#Exercicio 5
#Calcule a media e o desvio padrao para cada variavel considerando as categorias. 
aggregate(exercicio3$cont1~exercicio3$sexo, FUN = mean)
aggregate(exercicio3$cont2~exercicio3$sexo, FUN = mean)
aggregate(exercicio3$cont3~exercicio3$sexo, FUN = mean)

summary(exercicio3$cont1)

#Exercicio 6
# Utilizando a planilha iris, calcule a media e o desvio padrao do comprimento das sepalas.
head(iris)
tail(iris)

iris

mean(iris$Sepal.Length)
sd(iris$Sepal.Length)

aggregate(iris$Sepal.Length~iris$Species, FUN = mean)
aggregate(iris$Sepal.Length~iris$Species, FUN = sd)


#Exercicio 7
# Qual eh o valor 10 da 3 coluna?
head(iris)


iris[4,3]


#################################################
##                TARDE - Aula 1                #
##                                              #
##                                              #
#################################################

rm(list=ls())
getwd()
setwd("~/GitHub/Uso-do-R-e-Analises-de-dados")

#Leitura de dados .csv e .txt
## ARQUIVO SEPARADO POR TABULAçÂO

#install.packages("readxl")
library("readxl")

#metais_algas <- read_excel("metais_algas.xlsx")

algas <-  read.csv("metais_algas.csv")
head(algas)

algas <-  read.csv("metais_algas.csv", sep = '\t')
head(algas)

algas <-  read.csv("metais_algas.csv", sep = ";")
head(algas)
str(algas)

algas <-  read.csv("metais_algas.csv", sep = ";", dec = ",")
head(algas)
str(algas)
View(algas)

library("readxl")
metais_algas <- read_excel("metais_algas.xlsx")
head(metais_algas)
View(metais_algas)



algas_subset <-  subset(algas, select = c("Especie.e.Genero","Grupo","Local.da.Coleta","NS","Estacao","Pb","Zn","As"))
head(algas_subset)

algas_num <-  algas[,-c(1:15)]
head(algas_num)

#USAR APPLY
mean(algas_num$Cd)
mean(algas_num$Pb)

apply(algas_num, 2, FUN = mean) #o dois indica que quero o cálculo por colunas

apply(algas_num, 1, FUN = mean) #o 1 indica que a média é por linhas


#USAR TAPPLY
tapply(algas_subset$Zn,INDEX = algas_subset$Estacao, FUN = mean)



#USAR AGGREGATE
aggregate(algas_subset$Zn~algas_subset$Estacao+algas_subset$Grupo, FUN = mean)

## AGORA vamos tentar selecionar e calcular alguns dados utilzando o que aprendemos na ultima aula

#Qual a classe da Coluna AS?
class(algas_subset$As)
# e da coluna NS
class(algas_subset$NS)
# Rode a funcao str e explique a estrutura da tabela. 
str(algas_subset)
class(algas_subset$As)

# Agora vamos entender mais funcoes de manipulacao de dados.

# E se eu quisesse analisar so os dados das Rhodophyta?
algas$Grupo == "Rhodophyta"

Rhodophyta = subset(algas, subset = (algas$Estacao == "Winter"))
head(Rhodophyta)


#Agora veremos qual o valor mÃ¡ximo para As em algas vermelhas. Para o Verao e Para o Inverno

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = max )

# E qual é valor da mediana dos dados?

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = median )

#################################################
# Exercicios

# Carregar a planilha metais_algas com o nome metais
metais = read_excel("metais_algas.xlsx")



# Selecione os dados de Inverno para algas rhodophyta.

Rhodophyta = subset(metais, subset = (metais$Grupo == "Rhodophyta"))

Winter = subset(Rhodophyta, subset = (Rhodophyta$Estacao =="Winter"))
Winter


############################################################################
#                   Aula 2 - Manhã = Analises Exploratorias                #
############################################################################
rm(list=ls())
dev.off()
algas = read.csv("metais_algas.csv", sep = ";", dec = ",")

head(algas)
length(algas$As)

set.seed(42)
algas$N = rnorm(82,12,3)

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
} #Codigo_do_STACKOVERFLOW

# Analise Exploratoria 
# DISTRIBUICAO
# MEDIA; MEDIANA;MODA; DESVIO PADRAO; MAX; MINIMO;VARIANCIA 

# PARA Essas Analises faremos um subset com os dados de metais, sal, temp, Especies, Grupos, Locais, Face e Estacao do Ano

algas_sub = subset(algas,select = c("Especie.e.Genero","Grupo","NS","Estacao","Temp","Salinidade","Cd","Pb","Zn","Cu","Hg","As","N"))
head(algas_sub)


algas_num = algas_sub[,-c(1:4)]
media = apply(algas_num,2,mean)
desvPad = apply(algas_num,2,sd)
mediana= apply(algas_num,2,median)
max = apply(algas_num,2,max)
min = apply(algas_num,2,min)
moda = apply(algas_num,2,getmode)
var = apply(algas_num,2,var)
data.frame(media,desvPad,var,mediana,moda,max,min)
dados = t(data.frame(media,desvPad,moda,var,mediana,max,min))
dados
dados_arredond = round(dados,2)

getwd()
write.table(dados_arredond, file = "descritiva_metais.csv", sep = ";", dec = ",")
read.table("descritiva_metais.csv", sep=";", dec = ",")


#Exercícios
#Faça uma análise descritiva da planilha (Iris), 
##descreva os principais parâmetros totais e por espécie.

iris_sp1 = subset(iris, subset = (iris$Species == "versicolor"))
str(iris_sp1)
iris_sp1 = iris_sp1[,-5]
media_set = apply(iris_sp1,2,mean)
desvPad_set = apply(iris_sp1,2,sd)
mediana_set= apply(iris_sp1,2,median)
max_set = apply(iris_sp1,2,max)
min_set = apply(iris_sp1,2,min)
moda_set = apply(iris_sp1,2,getmode)
var_set = apply(iris_sp1,2,var)
data.frame(media_set,desvPad_set,var_set,mediana_set,moda_set,max_set,min_set)
dados_vers = t(data.frame(media_set,desvPad_set,var_set,mediana_set,moda_set,max_set,min_set))
quantile(iris_sp1$Petal.Length, 0.60)

#Salve esses dados em planilhas chamadas - Descritiva_sp1.csv
write.table(dados_iris, file = "Descritiva_sp1.csv", sep = ";", dec = ",")


##################################################################################
#                         AULA 2 - TARDE - Graficos                              #
##################################################################################
# Graficos

rm(list=ls())
dev.off()
algas = read.csv("metais_algas.csv", sep = ";", dec = ",")
head(algas)
length(algas$As)
set.seed(42)
algas$N = rnorm(82,12,3)
algas_sub = subset(algas,select = c("Especie.e.Genero","Grupo","NS","Estacao","Temp","Salinidade","Cd","Pb","Zn","Cu","Hg","As","N"))
head(algas_sub)
algas_num = algas_sub[,-c(1:4)]

apply(algas_num,2,summary)
summary(algas_sub$N)

hist(algas_sub)

hist(algas_sub$As)
hist(algas_sub$N)
boxplot(algas_sub$N)

qqnorm(algas_sub$N)
qqline(algas_sub$N)

#Separado
aggregate(algas_sub$N~algas_sub$Estacao+algas$Grupo, FUN = mean)


qqnorm(algas_sub$N[algas_sub$Grupo == 'Phaeophyceae'])
qqline(algas_sub$N[algas_sub$Grupo == 'Phaeophyceae'])


boxplot(algas_sub$N~algas_sub$Estacao+algas_sub$Grupo, 
        col = c("grey10","grey40","grey70","grey100"))
boxplot(algas_sub$N~algas_sub$NS+algas_sub$Grupo)


Grupo = table(algas_sub$Grupo)
SP = table(algas_sub$Especie.e.Genero)
NS = table(algas_sub$NS)
Estacao= table(algas_sub$Estacao)
N = algas_sub$N

barplot(Grupo, horiz = T)

barplot(Grupo, col = c("orange","pink"), ylim = c(0,100),
        ylab = "Numero Coletado", main = "ALGAS AMOSTRADAS")
plot(N , col = c(1:20), pch = 16)
pie(Grupo)
pie(Estacao)
barplot(SP)
plot(algas_sub$Cu~algas_sub$Zn,col = c(1:10), pch = 15)


install.packages("sciplot")


library(sciplot)
bargraph.CI(algas_sub$Estacao,algas_sub$N)
bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo)
bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo, 
            ylim = c(0,20))
bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo, 
            ylim = c(0,20), ylab = "Concentracao")
bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo,
            ylim = c(0,20), ylab = "Concentracao",
            xlab = "Estacao")
bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo, 
            ylim = c(0,20), ylab = "Concentracao", 
            xlab = "Estacao", legend = T)
abline(h=0)
abline(h=10, col = "blue", lty= 3)
abline(v=3.5, col = "red")
abline(v=3.3, col = "red")
#locator(1)

par(mfrow=c(2,3))

bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo, ylim = c(0,20), ylab = "Concentracao", xlab = "Estacao")
bargraph.CI(algas_sub$Estacao, algas_sub$As, algas_sub$Grupo, ylim = c(0,100), ylab = "Concentracao", xlab = "Estacao")

par(mfrow=c(1,1))
bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo, ylim = c(0,20), ylab = "Concentracao", xlab = "Estacao")
bargraph.CI(algas_sub$Estacao, algas_sub$As, algas_sub$Grupo, ylim = c(0,100), ylab = "Concentracao", xlab = "Estacao")

getwd()
jpeg(filename = "grafico_pronto.jpeg",width = 2400, 
     height = 1600,res = 300)

par(mfrow=c(1,1),cex.axis=1.15,cex.lab=1.3,las=1,bty= "l", 
    tcl=-0.2,cex=1.4,mar=c(5,6,4,2), pch=16, family="serif")
bargraph.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo,
            ylab="",lc=F,xlab="",xaxt="n", ylim=c(0,50),
            err.width = 0.15)
#lineplot.CI(algas_sub$Estacao, algas_sub$N, algas_sub$Grupo,
 #            ylim=c(0,20),err.width = 0.15, legend = F, type= "p")
#locator(4)
axis(side=1, at=c(2,5), labels=c("",""))
mtext(c("Verao","Inverno"),at=c(2,5),side=1,
      line=0.2,cex=1.4,family = "serif")
mtext("ug.g \n Metais", side=2, line=3.4,las=0, cex=1.4,
      family = "serif")
mtext("Estaçao do Ano", side=1, line=2.4,las=0, 
      cex=1.4, family = "serif")
legend(.8,50,legend=c("Phaeophyceae","Rhodophyta"), 
       col=c("grey40","grey90"), pch=16, cex=0.8,bty = "n")
abline(h=10)
text(x = c(2,5), y = c(30), labels = c("A", "A"),family = "serif")
text(x = c(1.5,2.5,4.5,5.5), y = c(20),
     labels = c("a", "b"),family = "serif")

dev.off()

# Utilizando a planilha Iris. 

#Consiga os seguintes  parametros de comprimento de petala.

## Media, Mediana, DesvPad, Maximo e Minimo.
iris_petala = iris$Petal.Length 
str(iris_petala)
media_pet = mean(iris_petala)
desvPad_pet = sd(iris_petala)
mediana_pet= median(iris_petala)
max_pet = max(iris_petala)
min_pet = min(iris_petala)
moda = getmode(iris_petala)
n = length(iris_petala)
data.frame(n,media_pet,desvPad_pet,mediana_pet,moda,max_pet,min_pet)
dados_petala = t(data.frame(media_pet,desvPad_pet,moda, mediana_pet,max_pet,min_pet))
round(dados_petala,2)


num = c(1,10,2000)
med = mean(num)
sd = sd(num)
data.frame(med,sd)
n = length(num)
max = max(num)
min = min(num)
data.frame(n, min, med,sd, max)

#Ha alguma outra medida que podemos extrair dos dados?
# n amostral
# moda
# variancia
# quantil

## Faca um Boxplot para comprimento da sepala e outro para comprimento da petala. 
par(mfrow = c(1,2))
boxplot(iris$Sepal.Length)
boxplot(iris$Petal.Length)

## Faca um Histograma com os dados de largura de sepala. 
hist(iris$Sepal.Width)
hist(iris$Petal.Length)

# Construa um grafico com margens = 3, 
#aumento dos eixos e um titulo. 
#Use as cores, azul, verde e vermelho. 
#Os dados Sao os do Data.Frame abaixo
A = runif(30,10,20)
B = runif(30,20,30)
C = runif(30,30,40)
para_grafico = c(A,B,C)

cores=rep(c("green","blue","red"), each = 30)
par(mar=c(3,6,3,3), cex.axis = 1.5,bty = "l", las = 1)
par()
plot(para_grafico, col = cores, pch = rep(c(17,15,16),each = 30),
     main = "JA ESTOU DOMINANDO OS \n GRAFICOS NO R", xaxt = "n")

mtext(c("Laurencia","Palisada", "Chondrophycus"),at=c(14,49,81),side=1,
      line=0.5,cex=1.4,family = "serif")
axis(side = 1, at = c(14,49,81), labels = c("","",""))
dev.off()


###################################################################
###                        AULA 02/12                        ######      
###################################################################


###############   Regressao Linear    #####################

#csv2 indica que as colunas sao separadas por ; (ponto e virgula)
#row.names = 1    indica que a o nome das linhas está na coluna 1

rm(list=ls())
regressao<- read.csv2("regressao.csv", row.names = 1)
str(regressao)

regressao

biomassa<-regressao$Biomassa
toxina <- regressao$Toxinas


#Coeficiente de Correlação de Pearson
#cor(x,y)
cor(biomassa,toxina)


#Coefiente de Determinação
cor(biomassa,toxina)^2


## Grafico de distribuicao - scatterplot
## plot (x,y)

plot(biomassa,toxina, xlab= "Biomassa (kg)", ylab = "Toxina (mg)")

# Calcular a Regressao Linear
# linear model lm(y~x) = linear model(variavel dependente ~ variavel independente)

lm (toxina~biomassa)

reg<-lm (toxina~biomassa)
summary(reg)

##The adjusted R-squared is a modified version of R-squared that has been adjusted 
##for the number of predictors in the model

#text - dentro do gráfico - coordenadas em x e y
text(4.5,5,"R2= 0,5427",cex = 1)

#Plotar a reta

abline(reg, col ="red")
summary(reg)

#fixar origem do plot em zero
par(xaxs="i", yaxs="i")
# xaxs yaxs =  The style of axis interval
# Style "i" (internal) finds an axis labels that fits within the data range 
# (data range pode ser determinado utilizando ylim xlim)

plot(biomassa,toxina, xlab= "Biomassa (kg)", ylab = "Toxina (mg)", ylim=c(0,70), xlim=c(0,6))
abline(reg, col ="red")
text(4.5,5,"R2= 0,5427",cex = 1)

## Resíduo
## Linearidade, Normalidade, Variância e outliers

#plotar 4 gráficos 2 linhas, 2 colunas
par(mfrow = c(2, 2))

#plotar resíduos da regressão
plot(reg)


########################################

#### curva padrão - espectrofotometria

proteina <- c(0,2,4,8,10,12,14) 
abs <- c(0,0.098,.196,.583,.793,0.987,1.166)

lm(abs~proteina)
plot(abs~proteina)
curva_padrao <- lm(abs~proteina)
summary(curva_padrao)

abline(curva_padrao)

a <- coef(curva_padrao)[2] #a = angulo
a
b <- coef(curva_padrao)[1] #b = ponto de interseção da reta em y
b

# y= ax + b
# x= (y-b)/a

(1-b)/a

#plotar fórmula
text(5,1,paste('y=',a,'x','+',b),col="black") #exercício - editar gráfico


#################################################
############## QUI-QUADRADO #####################

freq_tox <- as.table(cbind(c(95, 20, 70), c(40, 100, 65)))
?cbind

freq_tox 

?dimnames

dimnames(freq_tox) <- list(Espécie = c("Sp1", "Sp2","Sp3"),
                           Toxina = c("Sim","Não"))
freq_tox

#teste qui quadrado - chi square
test<-chisq.test(freq_tox)
test

test$p.value #rejeito H0
test$expected

##acima ou abaixo do esperado??

test$residuals
round(test$residuals,2)

library(corrplot)
corrplot(test$residuals, is.corr = F)

install.packages("chisq.posthoc.test")
library(chisq.posthoc.test)

tx<- chisq.posthoc.test(freq_tox)
tx

#nível de sig - 0,05

############################################
################ TESTE - t #################

?t.test()
#alternative - teste bicaudal, unicaudal maior ou unicaudal menor
#mu - média conhecida
#paired - Amostras independentes ou dependentes (paired)
#var.equal - homocedasticidade


#### One sample - Uma amostra

cha <- rnorm(20,110,15)
cha
t.test(cha, mu=130, alternative= c("less")) #rejeitar H0

#### Teste pareado - amostras dependentes

set.seed(12)
controle<-rnorm(10,30,2)
choque<-rnorm(10,33,3)

#testar normalidade
hist(controle)
qqnorm(controle)

hist(choque)
qqnorm(choque)

#nível de sig 0.05
shapiro.test(controle) #p. valor 0.86 = normais  
shapiro.test(choque) #p. valor 0.9 = normais


#testar homocedasticidade
Toxinas<-c(controle,choque)
Toxinas

tratamento<-as.factor(rep(c("controle","choque termico"),each = 10))
tratamento

var.test(Toxinas~tratamento) #Test de F de Fischer, duas variâncias
# p. 0.76 = homocedasticidade

bartlett.test(Toxinas~tratamento) # mais de duas variâncias
# p. 0.769 = homocedasticidade

boxplot(Toxinas~tratamento)

t.test(Toxinas~tratamento, alternative = c("g"), paired = T, var.equal = T)
# nivel 0.05  p. valor 0.005 (rejeito H0)
# H0 med controle = med tratamento 
# H1  med tratam > med controle


# TESTE - t

?t.test
### Normalidades???
### Uni ou Bicaudal???
### Homocedastico??
### Amostras independentes???

#e se as amostram forem independentes????
t.test
t.test(Toxinas~tratamento, alternative="g", paired = F, var.equal = T)
# nível de sig 0.05
# p. valor 0.001145
# rejeito H0


library(sciplot)
bargraph.CI(tratamento,Toxinas, ylim=c(0,50),xlab="",ylab="",xaxt="n")
mtext(c("Choque Térmico","Controle"),at=c(0.75,2),side=1,line=0.5,cex=1)
mtext(c("Toxinas/mg"),side=2, line=2.5,cex=1)


sessionInfo()
citation()


###################################################

################### Exercicios ####################
###################################################

## Regressao
View(regressao)
##Remover valores mais extremos do experimento

regressao2<- regressao[-c(1,25,26),]

##Qual o valor da correlação de Pearson?
cor(regressao2$Toxinas,regressao2$Biomassa) # 0.8

##Qual o valor do coeficiente de determinção?
cor(regressao2$Toxinas,regressao2$Biomassa)^2

##Como ficaram as premissas? (resíduo)

par(mfrow=c(2,2))
reg2<-lm(regressao2$Toxinas~regressao2$Biomassa)
plot(reg2)

##Qual sua opinião sobre a remoção destes valores, dado as informações que vocês tem?

## Estilizar o plot da curva padrão
## reta, pontos, nome dos eixos
## Equação linear
## Coeficiente de determinação


###################################################
## Qui-quadrado 

## Fazer a análise do qui-quadrado com os dados Ficticios de educação
## Qual sua conclusão geral?
## qual o nível de ensino minimo para ficar rico

educacao<-read.csv2("educacao.csv",row.names = 1)

teste2<-chisq.test(educacao)


teste2$p.value
teste2$expected

##acima ou abaixo do esperado??

teste2$residuals
round(teste2$residuals,2)

library(corrplot)
corrplot(teste2$residuals, is.corr = F)

#teste dentro de grupos
chisq.posthoc.test(educacao, round = 2)


###################################################
## Test-T

## Teste-t é apenas para 2 médias
## então vamos cortar a planilha Iris, a manter apenas as espécies setosa e versicolor

head(iris)
View(iris)

SetosaEVersicolor<-iris[-c(101:150),]
View(SetosaEVersicolor)

## testar normalidade e homocedasticadade para Petal.Length de cada espécie

versicolor <- subset(SetosaEVersicolor, SetosaEVersicolor$Species == "versicolor")
View(versicolor)


hist(versicolor$Petal.Length)
qqnorm (versicolor$Petal.Length)
shapiro.test(versicolor$Petal.Length) # p-value = 0.1585, teste de normalidade

# Setosa

setosa <- subset(SetoVer, SetoVer$Species == "setosa")

hist(setosa$Petal.Length)
qqnorm (setosa$Petal.Length)
shapiro.test(setosa$Petal.Length)


##Teste de homocedasticidade

var.test(setosa$Petal.Length,versicolor$Petal.Length) #p-value = 1.026e-10
#não temos homocedasticidade


var.test(sqrt(setosa$Petal.Length),sqrt(versicolor$Petal.Length))# p-value = 0.001101
#não temos homocedasticidade
#informar a ausência de homocedasticidade no teste-t


## comparar a média do Petal.Lenght utilizando teste-t
t.test(setosa$Petal.Length,versicolor$Petal.Length, alternative = "two.sided", paired= F, var.equal=F)

# p. valor < 2.2e-16 - rejeito H0
#a média de comprimento de petalas entre setora e versicolor é singificativamente diferente

boxplot(setosa$Petal.Length,versicolor$Petal.Length)


##############################################################################
#####                       AULA 09/12/2020                              #####
##############################################################################

rm(list=ls())

##Funções importantes
#
version
#informações detalhadas sobre a versão do R que você está usando
#
sessionInfo()
#Informações sobre a versão do R, o sistema operacional e pacotes carregados

#
citation()
#mostra como citar o R e seus pacotes

#Instalar e carregar pacotes importantes
install.packages("multcomp")
install.packages("MASS")
install.packages("lme4")
install.packages("car")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("rstatix") 
install.packages("ggplot2")
install.packages("GAD")
install.packages("ez") 
install.packages("reshape") 



#ANOVA DE 1 FATOR

#Abundancia de maria farinha em diferentes praias

#Importar os dados
data <- read.table("mariafarinha.txt", header = T, sep= "")
data

#NOMEAR OBJETOS
abundancia<-data$abundancia
praia<-data$praia

#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
is.factor(praia)
is.numeric(abundancia)

as.factor(praia)
data$praia<-as.factor(data$praia)

#Cria modelo(variavel resposta ~ variavel categorica)

anova1 <- aov(abundancia ~ praia, data=data)


anova2 <- aov(abundancia ~ as.factor(praia), data=data)


#testar pressupostos
par(mfrow= c(2,2))
plot(anova1)
dev.off()

#Pressupostos estão ok?

#Fiquei na duvida se deu normalidade

shapiro.test(resid(anova1))
#p>0,05 = normalidade dos dados

bartlett.test(abundancia ~ praia)

#Olhar o resultado do modelo
summary(anova1)

#Diferença entre os níveis do tratamento -> pelo menos uma média diferente
#Mas qual nível? --> teste a posteriori

TukeyHSD(anova1)

#resultado: todas as prais são diferentes entre si

##################################################################
rm(list=ls())

#ANOVA DE 2 FATORES

#Efeito da temperatura de do pH No consumo de algas pelo caranguejo Pachygrapsus transversus

#IMPORTAR DADOS
data <- read.table("alimentacao.txt", header = T, sep= "")
data

#NOMEAR OBJETOS
temperatura<-data$temperatura
consumo<-data$consumo
ph<-data$ph

#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
#Dica: variavel categórica --> usar uma letra
is.factor(temperatura)

temperatura<-as.factor(data$temperatura)
is.factor(temperatura)

ph<-as.factor(data$ph)
is.factor(ph)

anova2 <- aov(consumo ~ temperatura + ph + temperatura*ph)

data$temperatura<-as.factor(data$temperatura)
temperatura <- data$temperatura

data$ph<-as.factor(data$ph)
ph<-data$ph


data$praia<-as.factor(data$praia)

is.numeric(consumo)
is.factor(ph)

#Criar modelo(variavel resposta ~ variavel categorica1 + variavel categorica2 + categorica1*catergorica2))

anova2 <- aov(log(consumo) ~ temperatura + ph + temperatura*ph, data=data)

#Testar pressupostos
par(mfrow= c(2,2))
plot(anova2)

#Pressupostos estão ok?

#TRANSFORMAR OS DADOS
analise3 <- aov(log(consumo) ~ temperatura + ph + temperatura*ph, data=data)
par(mfrow= c(2,2))
plot(analise3)

#agora os dados estão ajustados


summary(analise3)

#deu significativo para temperatura e pH
#teste a posteriori para encontrar as diferenças

TukeyHSD(analise3)

#OU podemos fazer anova usando um modelo linear
#indicado para quando você quer usar um SS especifico
#carregar o pacote car

library(car)

analise4 <- lm(log(consumo) ~ temperatura + ph + temperatura*ph, data=data,contrasts=list(temperatura=contr.sum,
                                                                                          ph=contr.sum))

Anova(analise4, type="III")

##Se já estiverem dominando o R, pode fazer tudo em uma linha de comando só
#Eu gosto de separar para ser mais fácil verificar possíveis erros

Anova(lm(log(consumo) ~ temperatura + ph + temperatura*ph, data=data,contrasts=list(temperatura=contr.sum,
                                                                                    ph=contr.sum)), type="III")

#####################################################3
rm(list=ls())

#ANOVA DE MEDIDAS REPETIDAS

library(nlme)
library(lme4)
library(dplyr)

#Crescimento de plantas ao longo do tempo sob alta e baixa luminosidade

#Importar os dados
data <- read.table("repeatedmeasures.txt", header = T, sep= "")
data
View(data)

ID<-data$ID
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
#Considera ID como inteiro (numerico), mas não é


# Transformando a variável ID em fator
datalong$ID <- factor(datalong$ID)

#Olhar a estrutura dos dados denovo
glimpse(datalong)

str(datalong)
##Checar pressupostos
library(rstatix)
# %>% é um operador do R

#Verificando a presença de outliers por grupo
datalong %>% group_by(Tempo) %>% 
  identify_outliers(Biomassa)

#Nao existe outliers em nenhuma linha --> pressuposto ok!

# Verificando a normalidade por grupo
datalong %>% group_by(Tempo) %>% 
  shapiro_test(Biomassa)

#o pressuposto de esfericidade é testado dentro do modelo de anova com medidas repetidas
#se voce usar o pacote "ez" --> Teste de Mauchly's

#Montar o modelo de Anova de Medidas Repetidas
library(ez)
anovarepetida <- ezANOVA(data = datalong,
                         dv = Biomassa,
                         wid = ID,
                         within = Tempo,
                         detailed = TRUE,
                         type = 3)

# dv = variável dependente
# wid = variável de identificação do sujeito
# within = within subjects= variável independente de medidas repetidas
# type = tipo da soma dos quadrados (default é o tipo II)
#detailed = libera um resultado mais completo

#Pedir resultado do modelo
anovarepetida

#Teste de Mauchly's
#Ho-dados são esféricos
#H1-dados não são esfericos
#lembrar que a Anova de medidas repetidas tem um pressuposto de dados esféricos

#p é significativo, portante a hipotese nula foi rejeitada e nossos dados nao são esféricos
#nesse caso precisamos corrigir usando Greenhouse-Geisser (GGe) e Huynh-Feldt (HFe)
#a diferença é o tanto conservador são essas correções: GGe é mais conservador
#olhar os indices GGe e HFe, e ver o valor de p de cada um
#se p<0,05, é significativo e tem efeito do tempo
#pelo menos um dos tempo é diferente --> teste a posteriori

pairwise.t.test(datalong$Biomassa, datalong$Tempo, paired = TRUE,
                p.adjust.method = "bonferroni")

#usar o help da função p.ajust para escolher as opções de correção
?p.adjust 

#cruzar a primeira linha com as duas colunas para ver as comparações pareadas

#Análise descritiva dos dados (pacote: rstatix)
datalong %>% group_by(Tempo) %>% 
  get_summary_stats(Biomassa, type = "mean_sd")


boxplot(Biomassa ~ Tempo, data = datalong, ylab = "Biomassa", xlab = "Tempo")

################################################################
rm(list=ls())

#ANOVA COM MODELO MISTO (FATOR FIXO E FATOR ALEATORIO)
library(dplyr)

misto <- read.table("pontoaleatorio.txt", header = T, sep = "")
misto

#Analisar a estrutura dos dados
glimpse(misto)

#Nomear objetos
ponto<-misto$ponto
altura<-misto$altura
pesoalga<-misto$pesoalga

is.factor(ponto)
is.factor(altura)
is.numeric(pesoalga)

misto$ponto <- factor(misto$ponto)
misto$altura<- factor(misto$altura)

##pressupostos
#testar somente entre váriavel resposta e fator fixo, não entra fator aleatorio

fit2 <- aov(pesoalga ~ altura, data=misto)
par(mfrow = c(2,2))
plot(fit2)

##Montar modelo com fator fixo e aleatorio
#usando a função aov

fit <- aov(pesoalga ~ altura + Error(ponto), data=misto)
summary(fit)

#observe que usando aov, ele nao fornece um valor de p para o fator aleatorio
#não é fator de interesse
#alternativa1: montar o modelo com 2 fatores fixos e recalcular o F e o p
#alternativa2: montar modelo com fator fixo e aleatorio e comparar com um modelo de fator fixo só
#nesse caso é possivel testar se o fator aleatório é significativo, mas não tem o p


#Note que o efeito principal de Tratamento não é significativo
#portanto, não faz sentido teste a posteriori
#vamos fazer para aprender
summary(fit, split = list(altura = list('mesoinfra vs mesomesmo' = 0, 'mesoinfra vs mesosupra' = 1, 'mesomesmo vs mesosupra' = 2)))


#Outra forma de fazer: usando a função lm e o pacote GAD
library(GAD)

altura<-as.fixed(altura)

ponto<-as.random(ponto)

modelo<-lm(pesoalga~altura+ponto + altura*ponto)
gad(modelo)

#################################################################
rm(list=ls())

#ANCOVA

#A abundância de anfípodes é influenciado pela identidade da alga e pela temperatura

library(multcomp)
library(MASS)
library(lme4)

##Importar os dados

ancova <- read.table("anf.txt", header = T, sep= "")
ancova

#NOMEAR OBJETOS
Alga<-ancova$Alga
Anfipode<-ancova$Anfipode
temperatura<-ancova$temperatura

#CONFERIR SE O R ENTENDEU AS VARIAVEIS CATEGORICAS E NUMERICAS
#Dica: variavel categórica --> usar uma letra
is.factor(Alga)
is.numeric(Anfipode)
is.numeric(temperatura)

ancova$Alga <- as.factor(ancova$Alga)


##caso o R não reconheça como fator
##
library (tibble)
ancova <-as_tibble (ancova)%>% mutate (Alga = factor (ancova$Alga))

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
#p>0,05 aceitamos a hipotese nula: não existe efeito da variavel independente pela co-variavel

#3)Verificar se a relação entre a covariável e a VD é linear (VD ~ cov)
library(ggplot2) 

ggplot(data = ancova, aes(x = temperatura, y = Anfipode, group = Alga,
                          color = Alga)) +
  geom_point(size = 2) +
  xlab("Temperatura") +
  ylab("Anfipode") +   geom_smooth(method = "lm", se = FALSE, size = 0.5)


#são 3 retas= relações lineares


#4)Verificar se o efeito da covariável é o mesmo para todos níveis da VI (VD ~ VI*cov)
# Pressuposto: "homogeneidade dos parâmetros de regressão"
# Compara as inclinações das retas para cada grupo da VI

mod_int <- aov(Anfipode ~ Alga*temperatura, data = ancova)
summary(mod_int)

#Nesse caso, o que importa é só olhar a interação
#Se a interação não significativa --> aceito H0: homogeneidade dos parametros da regressão

#5)Montar o modelo da Ancova, usando SS do tipo"I"
#variavel resposta ~ co-variável + variavel dependente + co variavel*variavel dependente
#Obrigatório a co-variável vir primeiro no modelo
ancova1 <- aov(Anfipode ~ temperatura + Alga + Alga*temperatura, data=ancova)
summary(ancova1)

#O que é significativo?
#E se eu esquecer disso? rodar novamente o teste e comparar o resultado
ancova2 <- aov(Anfipode ~ Alga + temperatura + Alga*temperatura, data=ancova)
summary(ancova2)


#Modelo de Ancova, usando o  SS do tipo"III" e comparar

ancova3 <- lm(Anfipode ~ temperatura + Alga + Alga*temperatura, contrasts=list(Alga=contr.sum),data=ancova)
Anova(ancova3, type="III")
library(car)

#Reparem que usamos o contraste só para Alga e não para temperatura. Por que?
#

#Efeito apenas do fator Alga
#Teste a posteriori
library(multcomp)

#montar um modelo sem a interação para fazer o a posteriori
ancova4 <- lm(Anfipode ~ temperatura + Alga, contrasts=list(Alga=contr.sum),data=ancova)
Anova(ancova4, type="III")

posthoc <- glht(ancova4, linfct = mcp(Alga = "Tukey"))
summary(posthoc)

#Resultado: Sargassum é diferente de Padina e Dichotomaria


#Se tivesse efeito da temperatura: variavel resposta continua x co variavel continua

posthoc2 <- lm(Anfipode ~ temperatura, data=ancova)
summary(posthoc2)

plot(temperatura,Anfipode, xlab= "Temperatura(°C)", ylab = "Anfipode")
abline(posthoc2, col ="green")

#######################################################################
rm(list=ls())

#GLM
#Análisar o efeito da temperatura e do tempo sobre a quantidade de carbono na alga

library(multcomp)
library(MASS)
library(lme4)

#Importar dados
data <- read.table("analisealgas.txt", header = T, sep= "")
data

#Nomear objetos
temp<-data$temp
time<-data$time
Carbono<-data$Carbono

#Verificar se o R entendeu
is.factor(temp)
is.factor(time)
is.numeric(Carbono)

data$temp <- as.factor(data$temp)
data$time <- as.factor(data$time)

#Montar modelo
#Escolher familia da distribuição --> quasibinomial (dados de proporção)

carb <- glm(Carbono ~ time + temp + time*temp, family=quasibinomial(link="logit"), data=data)
summary(carb)

#olhar a dispersão dos dados --> menor que 1, não tem overdispersion
anova(carb, test= "Chi")

#resultado: não tem efeito da interação
#vamos usar a função drop1 para ver se a ordem importa

drop1(carb, test= "Chisq")

#a interação não deu significativo, vou tirar do modelo
#montar o modelo reduzido

carb.1 <- glm(Carbono ~ time + temp, family=quasibinomial(link="logit"), data=data)
summary(carb.1)
anova(carb.1, test= "Chisq")

drop1(carb.1, test= "Chisq")

anova(carb, carb.1,test="Chisq")
#comparação entre modelos mostrou que não tem diferença -> usar modelo reduzido


#teste a posteriori para cada fator separadamente

resultado <- glht(carb.1, linfct = mcp(time = "Tukey"))
summary(resultado)

resultado2 <- glht(carb.1, linfct = mcp(temp = "Tukey"))
summary(resultado2)

###OUTRO EXEMPLO
#A abundancia de gastropoda é influenciada pela identidade da alga e pela temperatura
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

data$Data <- as.factor(data$Data)
data$Alga <- as.factor(data$Alga)

M3 <- glm(Gastropoda ~ Alga + temperatura + Alga*temperatura, family=quasipoisson(),data=data)
summary(M3)
anova(M3, test = "F")
drop1(M3, test= "F") 

#não deu signiticativo para interação
#o drop1 mostrou que a interação não é importante -> retirar a interação

M4 <- glm(Gastropoda ~ Alga + temperatura, family=quasipoisson(),data=data)
summary(M4)
anova(M4, test = "F")
#efeito da temperatura apenas

anova(M3, M4,test="F")
#comparação entre modelos mostrou que não tem diferença -> usar modelo reduzido


#regressão entre densidade de gastropode e temperatura

M4.1 <- glm(Gastropoda ~ temperatura, family=quasipoisson(), data = data)
anova(M4.1, test ="F")
summary(M4.1)

#########################################################################
rm(list=ls())

#Exercícios

#1) Anova de 1 fator
#Usar a planilha Iris
#Verificar se o comprimento da pétala (Sepal.Lenght) e o comprimento da sépala (Sepal.Lenght) varia entre as espécies
#Fazer separadamente para pétalas e sépalas
#Se tiver diferenças, fazer o teste a posteriori de Tukey
iris
sepala<-iris$Sepal.Length
petala<-iris$Petal.Length
especies<-iris$Species

#Para Sepal.Lenght

comprimento<-aov(sepala ~ especies)
par(mfrow=c(2,2))
plot(comprimento)
dev.off()

summary(comprimento)

TukeyHSD(comprimento)
    
#Para Petal.Lenght
comprimento2<-aov(log(petala) ~ especies)
par(mfrow=c(2,2))
plot(comprimento2)
dev.off()

summary(comprimento2)

TukeyHSD(comprimento2)

#2)Usar a planilha fauna2"
#A abundancia de anfípode é influenciada pela "Data" e pela "Alga"?

#Analise de variância (Varivel resposta ~ fator1*fator2)

data <- read.table("fauna2.txt", header = T, sep= "")
data

Data<-data$Data
Alga<-data$Alga
Anfipode<-data$Anfipode

is.factor(Data)
is.factor(Alga)
is.numeric(Anfipode)

data$Data <- as.factor(data$Data)

modelo<-aov(sqrt(Anfipode) ~ Data + Alga + Data*Alga, data=data)
par(mfrow = c(2,2))
plot(modelo)
summary(modelo)

modelo1<-glm(Anfipode ~ Data + Alga + Data*Alga, family=quasipoisson, data=data)
summary(modelo1)
anova(modelo1, test= "F")

AlgaData <-interaction(Alga, Data, drop= TRUE)

modelo2<-glm(Anfipode ~ AlgaData, family=quasipoisson, data=data)
resultado<-glht(modelo2, linfct=mcp (AlgaData= "Tukey"))
summary(resultado)


modelo3 <- glm(Anfipode ~ AlgaData, family=quasipoisson, data=data)

result <- glht(modelo3, linfct= mcp(AlgaData = "Tukey", interaction_average = TRUE))
summary(result)


#3) Aprendendo sobre a importância dos pressupostos
# Usar a planilha riqueza
#Efeito do tempo de sucessão e da condição (tratamento) na riqueza da fauna
#Anova de 2 fatores: "tempo" e "condição"

data<-read.table("riqueza.txt", header= T, sep="")
data

#nomear objetos
riqueza<-data$riqueza
tempo<-data$tempo
condição<-data$condição

#Conferir se o R entendeu 
is.factor(tempo)
is.numeric(riqueza)
is.factor(condição)

#Se o R nao entender, usar
data$tempo <- as.factor(data$tempo)
data$condição <- as.factor(data$condição)

#Como estão os pressupostos?

riq1 <- aov(riqueza ~ tempo*condição, data)
par(mfrow= c(2,2))
plot(riq1)

#Fazer o teste sem transformar os dados
summary(riq1)

#Qual o resultado?
#Condição é significativo e o tempo não é significativo (marginal)

#E se eu transformar? como transformar?
#tranformação usando raiz-->dados contínuos
riq2 <- aov(sqrt(riqueza) ~ tempo*condição, data)
par(mfrow= c(2,2))
plot(riq2)
#rodar o teste e comparar o resultado
summary(riq2)

#condição é significativa e tempo não é (menos marginal)

#e se eu tranformar em log? não é o mais adequado pros nossos dados
riq3 <- aov(log(riqueza) ~ tempo*condição, data)
par(mfrow= c(2,2))
plot(riq3)
#comparar o resultado
summary(riq3)
#nada é significativo

#E se usar glm?
#Qual família usar? 
#fazer com Poisson e ver resultado-> tentar poisson pois sao dados de contagem discretos
riq4 <- glm(riqueza ~ tempo*condição, family=poisson, data=data)
summary(riq4)
anova(riq4, test = "Chi")
#não tem overdispersion
#fazer o drop para ver se a interação nao é significativa
drop1(riq4)

#nada é significativo

#E se eu usasse quasi-poisson? Não é o mais adequado
riq5 <- glm(riqueza ~ tempo*condição, family=quasipoisson, data=data)
summary(riq5)
anova(riq5, test = "Chisq")

#condição é significativo e o tempo não

#########################################################
############ Multivariadas ##############################

rm(list=ls())

library(vegan) #Pacote para fazer ordenações


###########################################################################
################### PCA - Principal Components Analysis ###################

#executar PCA em uma planilha de dados ambientais em diferentes ambientes

env<-read.csv("DoubsEnv.csv", row.name= 1)
View(env)
summary(env)

#devido as diferentes unidades de medida será necessário fazer uma transformação dos dados
#para fazer a transformação utiliza-se o argumento "scale=TRUE" significa que quero que faça transformaçao
#RDA é a função para fazer PCA

env.pca<-rda(env, scale=T) #não preciso de matriz pq PCA usa obrigatoriamente euclidiana
env.pca
summary(env.pca)
biplot(env.pca, xlab="PC1(54%)", ylab="PC2(20%)")

#scaling é uma função que define como as coordenadas dos pontos são contruídas no gráfico
#default scaling no R são os locais (independente)
#usando scaling=1 prioriza as variáveis(dependente)

biplot(env.pca, scaling= 1, xlab="PC1(54%)", ylab="PC2(20%)")


par(mfrow=c(1,2))
biplot(env.pca, xlab="PC1(54%)", ylab="PC2(20%)")
biplot(env.pca, scaling= 1, xlab="PC1(54%)", ylab="PC2(20%)", main="scaling1")
dev.off()

ambiente<-rep(c("Estuario","Rio","Lagoa"),each=10)
ambiente

## Substituir número por pontos
## "sites" é o nome dado as amostras
## "species" é o nome dado as variáveis

biplot(env.pca, 
       scaling= 1,
       xlab="PC1(54%)", ylab="PC2(20%)",
       main="PCA",
       display = c("sites", "species"),
       type = c("text","points"))

# Mostrar agrupamento por ambiente
# Se usou scaling no plot acima, precisa usar scaling 1 aqui tbm

ordihull(env.pca,scaling=1,
         group = ambiente,
         col = c(1,2,3))

# Colocar legenda

legend("topright",
       col = c(1,2,3), 
       pch = 1,
       cex = 0.6,
       legend = c("Estuário","Rio","Lagoa"))


######################################################
######### PCoA- Principal Coordenate Analysis ########
rm(list=ls())

data(dune)
head(dune)
str(dune)

## Gerar matriz com vegdist, função que já vem com o pacote vegan
library(vegan)
?vegdist

#dados de contagem, usar disimilaridade Bray-Curtis
matriz.dune<-vegdist(dune, method="bray")
round(matriz.dune,2)

?cmdscale #função para gerar PCoA, vem junto com o pacote vegan
dune.pcoa<-cmdscale(matriz.dune, eig=TRUE)
dune.pcoa$eig

#pacote ape extrai eigenvalues humanizado(de fácil compreensão humana)
library(ape)
eigen<-pcoa(matriz.dune)
eigen$values

#plotar pcoa com a função ordiplot
ordiplot(dune.pcoa)

#plotar identificador de amostras
ordiplot(dune.pcoa, type='t')

#plotar a ordenação
dune.pcoa$points #n tem o nome das sps, então vamos adicionar
dune.pcoa$species
dune.pcoa$species <- wascores(dune.pcoa$points,dune)
dune.pcoa$species

#editar pcoa 
plot.pcoa<-ordiplot(dune.pcoa, type="none")
points(plot.pcoa, "sites",pch=15, col=rep(c(1,3),each=10))
text(plot.pcoa,"species", cex=0.5)



#######################################################
########### non-metric MDS ############################

?metaMDS #função para fazer nMDS

#constroi a matriz direto dentro do nMDS
#Opção autotransform= T by default. Se não forem dados de comunidade é melhor desativar

nmds.dune<-metaMDS(dune, distance = "bray", try = 50)

nmds.dune # stress de 11% 
stressplot(nmds.dune)

#plotar ordenação
plot(nmds.dune)

#círuculos representam objetos/observações cruzes representam espécies
#mas n temos como saber quem é quem

#plotar com informações
plot(nmds.dune, type="t")

plot(nmds.dune, type="n")
points(nmds.dune, "sites",pch=15, col=rep(c(1,3),each=10))
text(nmds.dune, "species", cex= 0.5)



##Comparar pcoa e nmds
par(mfrow=c(1,2))

plot.pcoa<-ordiplot(dune.pcoa, type="none", main="PCoA")
points(plot.pcoa, "sites",pch=15, col=rep(c(1,3),each=10))

plot(nmds.dune, type="n", main="nMDS")
points(nmds.dune, "sites",pch=15, col=rep(c(1,3),each=10))


#######################################
######### PERMANOVA ###################

## pacotes para o teste pareado
install.packages('devtools')
library(devtools)
install_github("pmartinezarbizu/pairwiseAdonis/pairwiseAdonis")
library(pairwiseAdonis)

library(vegan)
data(dune)
data(dune.env)
View(dune.env) 

# Regulação para uso de cada área
# SF - standard farming,
# BF - biological farming
# HF - hobby-farming
# NM - nature conservation management


#testando homocedasticidade
#funcao betadisper

#gerar matriz
dune.matriz<-vegdist(dune, method="bray")

#teste de homocedastidicidade com betadisper
## IMPORTANTE...  o betadisper precisa de matriz !!!
?betadisper

regu<-betadisper(dune.matriz, dune.env$Management)
uso<-betadisper(dune.matriz, dune.env$Use)

#Resultado da homocedasticidade
anova(regu)
anova(uso)

#plotar as variâncias
#como é multidimensional, utiliza de centroides
#o nome dos grupos costuma aparecer mto grande
#use label.cex para reduzir o tamanho ou label = "F" para desativar
#pode trocar as linhas retas (hull), por ellipse

plot(regu, label.cex=0.5)
plot(uso, hull = FALSE, ellipse = TRUE, label = F)

#Caso dê significativo, fazer teste pareado para 
#identificar onde as varâncias são diferentes
permutest(uso, pairwise=T)

#adonis é um função para calcular a PERMANOVA !!
#adonis para 1 fator
adonis(dune ~ Management, data = dune.env, method="bray", permutations = 9999)

#teste pareado
pairwise.adonis(dune, dune.env$Management, perm = 9999)

## modelo com 2 fatores
adonis(dune ~ Management + Use, data = dune.env, method="bray", permutations = 9999)

# se trocar a ordem faz diferença? permutações....
adonis(dune ~ Use + Management, data = dune.env, method="bray", permutations = 9999)

#modelo com interação
adonis(dune ~ Use + Management+ Use*Management, data = dune.env, method="bray", permutations = 9999)


## pairwise.adonis NÃO aceita interações
## pairwise.adonis2 aceitará interação, trabalho em progresso. 

#Nas palavras do autor:

#pairwise.adonis2
#This function accepts strata
#NOTE: This is still a developing version -- 
#results using interactions may not be right.
#Please validate. I would appreciate feed back.
# https://github.com/pmartinezarbizu/pairwiseAdonis


############ Exercícios ##################

## 1) plotar PCA usando varechem data(varechem)
## Padronizar PCA devido a unidades diferente... SCALE=TRUE

data("varechem")
View(varechem)
summary(varechem) #verificar as médias e quão distantes eslas estão, bom pra ver isso

env.pca<-rda(varechem, scale=T) #não preciso de matriz pq PCA usa obrigatoriamente euclidiana
env.pca
summary(env.pca)
biplot(env.pca, xlab="PC1(37%)", ylab="PC2(22%)")

## 2) plotar PCoA e nMDS usando iris.
## Será necessário remover a coluna de characters (species)
data(iris)
iris$Species <- NULL
View(iris)
summary(iris)
str(iris)

#PCoA
library(vegan)
#dados de contagem, usar disimilaridade Bray-Curtis
matriz.iris<-vegdist(iris, method="bray")
round(matriz.iris,2)
iris.pcoa<-cmdscale(matriz.iris, eig=TRUE)

library(ape)
eigen<-pcoa(matriz.iris)
eigen$values

#plotar pcoa com a função ordiplot
ordiplot(iris.pcoa)

#plotar identificador de amostras
ordiplot(iris.pcoa, type='t')

#plotar a ordenação
iris.pcoa$points #n tem o nome das sps, então vamos adicion

iris.pcoa$points #n tem o nome das sps, então vamos adicionar
iris.pcoa$species
iris.pcoa$species <- wascores(iris.pcoa$points,iris, expand = T)
iris.pcoa$species

plot.pcoa<-ordiplot(iris.pcoa, type="none")
points(plot.pcoa, "sites",pch=16, col=rep(c(1,2,30),each=50))
legend("topright",
       col = c(1,2,30),
       pch = 16,
       cex = 0.6,
       legend = c("Setosa","Versicolor","Virginica"))

points(plot.pcoa, "sites",pch=rep(c(9,21,25),each=50), col="black")
text(plot.pcoa,"species", cex=0.8)


##MDS
nmds.iris<-metaMDS(iris, distance = "bray", try = 100)
nmds.iris # stress de 3% 
stressplot(nmds.iris)

#plotar ordenação
plot(nmds.iris)


#plotar com informações
plot(nmds.iris, type="t")
plot(nmds.iris, type="n")
points(nmds.iris, "sites",pch=rep(c(9,21,25), each=50), col= "black")
text(nmds.iris, "species", cex= 0.5)
legend("topright",
       col = 1,
       pch = c(09,21,25),
       cex = 0.6,
       legend = c("Setosa","Versicolor","Virginica"))




## 3) Permanova de Iris
## as caracteristicas das flores são diferentes entre as species?
data(iris)
head(iris)

aggregate(iris$Petal.Length~iris$Species, FUN = mean)

plot(iris$Sepal.Width, col = rep(c(1,4,3), each = 50),pch=16)
iris2 = iris[,-5]
head(iris2)

(permanova.iris = adonis(iris2~iris$Species, method="bray", permutations = 9999))

pairwise.adonis(iris2,iris$Species)

## 4) Conclusoes gerais analisando em conjunto uma ordenação (PcoA ou nDMS) e PERMANOVA




require(graphics); require(grDevices)
x  <- as.matrix(mtcars)
rc <- rainbow(nrow(x), start = 0, end = .3)
cc <- rainbow(ncol(x), start = 0, end = .3)
hv <- heatmap(x, col = cm.colors(256), scale = "column",
              RowSideColors = rc, ColSideColors = cc, margins = c(5,10),
              xlab = "specification variables", ylab =  "Car Models",
              main = "heatmap(<Mtcars data>, ..., scale = \"column\")")
utils::str(hv) # the two re-ordering index vectors
