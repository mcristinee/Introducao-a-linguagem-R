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

#Leitura de dados .csv e .txt
## ARQUIVO SEPARADO POR TABULAçÂO
#install.packages("readxl")
library("readxl")

metais_algas <- read_excel("metais_algas.xlsx")

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

library("readxl")
metais_algas <- read_excel("metais_algas.xlsx")
head(metais_algas)


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
aggregate(algas_subset$As~algas_subset$Estacao+algas_subset$Grupo, FUN = mean)

## AGORA vamos tentar selecionar e calcular alguns dados utilzando o que aprendemos na ultima aula

#Qual a classe da Coluna AS?
# e da coluna NS
# Rode a funcao str e explique a estrutura da tabela. 
str(algas_subset)

# Agora vamos entender mais funcoes de manipulacao de dados.

# E se eu quisesse analisar so os dados das Rhodophyta?
algas$Grupo == "Rhodophyta"


Rhodophyta = subset(algas, subset = (algas$Grupo == "Rhodophyta"))
head(Rhodophyta)

#Agora veremos qual o valor mÃ¡ximo para As em algas vermelhas. Para o Verao e Para o Inverno

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = max )

# E qual é valor da mediana dos dados?

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = median )

#################################################
# EXercicios

# Carregar a planilha metais_algas com o nome metais



# Selecione os dados de Inverno para algas rhodophyta.

Rhodophyta = subset(metais, subset = (metais$Grupo == "Rhodophyta"))


