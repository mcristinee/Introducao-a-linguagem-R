## AULA 2
rm(list=ls())
getwd()

#Leitura de dados .csv e .txt
## ARQUIVO SEPARADO POR TABULA��O
install.packages("readxl")
library("readxl")

metais_algas <- read_excel("metais_algas.xlsx")




algas <-  read.csv("metais_algas.csv", sep = '\t')
head(algas)

algas <-  read.csv("metais_algas.csv", sep = ";")
head(algas)
str(algas)

algas <-  read.csv("metais_algas.csv", sep = ";", dec = ",")
head(algas)
str(algas)


algas_subset <-  subset(algas, select = c("Especie.e.Genero","Grupo","Local.da.Coleta","NS","Estacao","Pb","Zn","As"))
head(algas_subset)

algas_num <-  algas[,-c(1:15)]
head(algas_num)

#USAR APPLY
mean(algas_num$Cd)


apply(algas_num, 2, FUN = mean)
apply(algas_num, 1, FUN = mean)


#USAR TAPPLY
tapply(algas_subset$Zn,INDEX = algas_subset$Estacao, FUN = mean)



#USAR AGGREGATE
aggregate(algas_subset$As~algas_subset$Estacao+algas_subset$Grupo, FUN = var)

## AGORA Utilizando dados reais, vamos tentar selecionar e calcular alguns dados utilzando o que aprendemos na ultima aula

#Qual a classe da Coluna AS?
# e da coluna NS
# Rode a funçao str e explique a estrutura da tabela. 
str(algas_subset)

# Agora vamos entender mais funçoes de manipulaçao de dados.

# E se eu quisesse analisar só os dados das Rhodophyta?
algas$Grupo == "Rhodophyta"


Rhodophyta = subset(algas, subset = (algas$Grupo == "Rhodophyta"))
head(Rhodophyta)

#Agora veremos qual o valor máximo para As em algas vermelhas. Para o Verao e Para o Inverno

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = max )

# E qual o valor que representa 50% dos dados?

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = median )

#################################################
# EXercícios aula 2

# Carrega a planilha metais_algas com o nome metais

metais <- read.csv("metais_algas.csv", sep = ";", dec = ",")


# Selecione os dados de Inverno para algas rhodophyta.

Rhodophyta = subset(metais, subset = (metais$Grupo == "Rhodophyta"))

rho_inverno = subset(Rhodophyta, subset = (Rhodophyta$Estacao == "Winter"))
r_inverno



# Aula 3 - Analises Exploratorias e Graficos
rm(list=ls())
#install.packages("sciplot")
library("sciplot")

algas = read.csv("metais_algas.csv", sep = ";", dec = ",")
head(algas)
length(algas$As)

algas$N = rnorm(82,12,3)

# Análise exploratória. 
# DISTRIBUICAO
# MEDIA; MEDIANA; DESVIO PADRAO; MAX; MINIMO; 
# Gráficos - Histograma, BoxPlot, DIspersao.

# PARA Essas ANálises vamos fazer um subset com os dados de metais, sal, temp, Especies, Grupos, Locais, Face e Estaçao do Ano

algas_exp = subset(algas,select = c("Especie.e.Genero","Grupo","NS","Estacao","Salinidade","Cd","Pb","Zn","Cu","Hg","As","N"))

head(algas_exp)


algas_num = algas_exp[,-c(1:4)]
media = apply(algas_num,2,mean)
desvPad = apply(algas_num,2,sd)
mediana= apply(algas_num,2,median)
max = apply(algas_num,2,max)
min = apply(algas_num,2,min)
data.frame(media,desvPad,mediana,max,min)
dados = t(data.frame(media,desvPad,mediana,max,min))
round(dados,2)

getwd()
write.csv(dados,file = "descritiva.csv")

hist(algas_exp$Zn)
boxplot(algas_exp$Zn)

hist(algas_exp$N)
boxplot(algas_exp$N)
qqnorm(algas_exp$Zn)
qqline(algas_exp$Zn)

qqnorm(algas_exp$N)
qqline(algas_exp$N)

#Separado
aggregate(algas_exp$Zn~algas_exp$Estacao+algas$Grupo, FUN = mean)

boxplot(algas_exp$Zn~algas_exp$Estacao+algas_exp$Grupo)
qqnorm(algas_exp$Zn[algas_exp$Grupo == 'Phaeophyceae'])
qqline(algas_exp$Zn[algas_exp$Grupo == 'Phaeophyceae'])

shapiro.test(log(algas_exp$Zn))

# Gráficos
boxplot(algas_exp$N~algas_exp$Estacao+algas_exp$Grupo)

library(sciplot)

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo)

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20))

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20), ylab = "Concentracao")

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20), ylab = "Concentracao", xlab = "Estacao")

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20), 
            ylab = "Concentracao", xlab = "Estacao", legend = TRUE, col = c("yellow",'darkred'))
#locator(1)
text(1.5,15.5,"Maximo")
abline(h=5, col="green", lty = 2)
abline(h=0, col=1, lty = 1)



Grupo = table(algas_exp$Grupo)
SP = table(algas_exp$Especie.e.Genero)
NS = table(algas_exp$NS)
Estacao= table(algas_exp$Estacao)

barplot(Grupo)


# Utilizando a planilha Iris. 

#COnsiga os principais parametros de comprimento de pétala.
## Média, Mediana, DesvPad, Maximo e Minimo.
#Há alguma outra medida que podemos extrair dos dados?

## Faça um Boxplot para comprimento da sépala e outro para comprimento da pétala. 

## Faça um Histograma com os dados de largura de sépala. 

# Construa um gráfico com margens = 3, aumento dos eixos e um título. 
#Use as cores, azul, verde e vermelho. Os dados São so do Data.Frame abaixo
A = runif(30,10,20)
B = runif(30,20,30)
C = runif(30,30,40)
(para_grafico = c(A,B,C))

cores=rep(c("green","blue","red"), each = 30)

plot(para_grafico, col = cores, pch = rep(c(17,15,16),each = 30))

# Qual a média de Pb por grupo?

# Utilize a funcáo aggregate para verificar os valores máximos de Zn para cada grupo em cada estaçao. 

# Utilize a funçao apply para calcular os valores médios para cada metal. Dica, tem que descartar os valores que nao sao numeros. 

# Qual o N amostral para Rhodophyta? E para Phaeophyceae?

# É possível montar uma planilha apenas com os dados de Phaeophyceae, no verao e na face Sul?

