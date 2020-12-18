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

table(algas$Especie.e.Genero)

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

numero = c(8,9,10,23,451,54,NA,NA,2)
mean(numero, na.rm = T)

12/0
0/12

sqrt(-3)

is.na(numero)









rm(list=ls())
citation()
version
sessionInfo()


iris_2spp <- subset(iris, subset = iris$Species !="virginica")
teste = subset(iris, subset = c(iris$Species=='versicolor', iris$Species =='setosa'))
View(teste)

hist()