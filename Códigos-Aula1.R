## AULA 1

#Nessa Nossa Primeira Aula iremos entender o que o R Faz.


#Ele pode funcionar como uma calculadora comum. Por exemplo:
3+4
4+19
22-13.3
30 - 14.3

3*8

16/4

#Conseguimos também fazer a raiz-quadrada, mas precisamos usar uma funçao.
sqrt(81)

sqrt(2)

log(10)

# Podemos calcular potências

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
a + c


# Posso tambem armazenar mais que 1 dado nesse vetor.
# Mas preciso utilizar a funcao concatenar 'c()'.
vetor1 = c(2,3,4,5,6,7) 

vetor2 = 10
length(vetor1)

vetor2 - vetor1

# Podemos criar sequencias aqui no R.

vetor3 = seq(from = 1, to = 2, length.out = 6)
vetor3
vetor4 = seq(from = 0, to = 2.5, by = 0.5)
vetor4

# Podemos repetir algum item tambem

vetor5 = rep("verao", 6)
vetor5
class(vetor5)

vetor6 <- rep(c("verao", "inverno"), each = 3)
vetor6

#Podemos informar a distribuiÃ§ao e pedir que o R gere numeros aleatorios

vetor7 = runif(6,12,14)
vetor7
vetor8 = rnorm(6,15,2)
mean(vetor8)
sd(vetor8)

# Aqui podemos tambem criar uma "Planilha" que no R eh chamada de Data.frame
planilha = data.frame (vetor1, vetor2, vetor3, vetor4, vetor5, vetor6,vetor7,vetor8)

print(planilha)
planilha

###Funcao - SAMPLE.


#data.frames aceitam mais de 1 classe de vetor. Matrizes nao aceitam.

# MATRIZ
matriz = as.matrix(planilha)
class(matriz)

#Qual o Problema?
#Oq houve?

#Vamos utilizar o nosso objeto planilha pra manipular data frames. 
# podemos selecionar dados de uma coluna chamando o objeto, colocando um $ e o nome da coluna. 

planilha$vetor7

uniforme = planilha$vetor7
mean(planilha$vetor7)
median(uniforme)

#Outra forma de selecionar eh atraves de indexacao. Onde colocamos [,] apos o nome do nosso objeto
# planilha[linhas,colunas]
planilha[,]

planilha[,5] # Pegamos a 5 coluna inteira

planilha[-3,] # Removemos 3 linha inteira

planilha[,-c(5,6)] # Remover colunas

planilha [3,4] # pegamos o valor que esta na linha 3 e coluna 4. 

# Agora usaremos os dados da planilha Iris no exemplo.

head(iris) # Essa funcao nos mostra as 5 primeiras linhas da planilha
iris
str(iris) # essa funcao nos mostra a estrutura da planilha, ou seja, a classe de cada uma das variaveis. 

# Entao vamos comecar a Manipular a planilha. Digamos que eu queira saber a media da largura das petalas para cada especie. 
# COMO FACO ISSO?
#Utilizo a funcao aggregate
aggregate(iris$Petal.Width~iris$Species, FUN = mean)


# EU posso armazenar essa informaÃ§ao?
(petala_largura_media = aggregate(iris$Petal.Width~iris$Species, FUN = mean))
petala_largura_media

#Vamos trocar o nome das colunas pra nao confundir 
colnames(petala_largura_media) <-  c("especie", "largura_media")
petala_largura_media

# VAmos adicionar tambem o desvio padrao nesse nosso data frame. 
petala_largura_desvpad = aggregate(iris$Petal.Width~iris$Species, FUN = sd)
colnames(petala_largura_desvpad) = c("especie","desvpad")

petala_largura_media$desvpad = petala_largura_desvpad$desvpad #coloquei a coluna desvio padrao
petala_largura_media


petala_largura_media$desvpad = petala_largura_desvpad$desvpad


sample(100,20, replace = F)

#Exercicio 1
# Crie um vetor com 40 numeros de 22 a 62.

#Exercicio 2
# Crie um vetor N = 40 com as palavras Verao e Inverno 

#Exercicio 3
# Crie um data.frame com 4 variÃ¡veis, 1 categorica, 3 continuas.
## Com N = 40.

#Exercicio 4
#Calcule a media e o desvio padrao para cada uma das variaveis. 

#Exercicio 5
#Calcule a media e o desvio padrao para da variavel considerando as categorias. 

#Exercicio 6
# Utilizando a planilha iris, calcule a media e o desvio padrao do comprimento das sepalas.

#Exercicio 7
# Qual eh o valor 10 da 3 coluna?
