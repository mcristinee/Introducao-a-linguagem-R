#Nessa Nossa Primeira Aula iremos entender o que o R Faz.

#Ele pode funcionar como uma calculadora comum. Por exemplo:
3+4
4+19
22-13.3
3*8
16/4

#Conseguimos também fazer a raiz-quadrada, mas precisamos usar uma funçao.
sqrt(81)

# Podemos calcular potencias

2^3
12^8

# Logaritimos tambem sao facilmente calculados
log(200)
log10(100)
log2(20)

## Média e Desvio Padrao
mean(c(12,14,15,16,19))
sd(c(12,14,15,16,19))

#Todos esses calculos apareceram no terminal. Mas e se eu quiser armazenar em algum lugar pra usar depois em outro cálculo?
#Entao eu uso um 'objeto' ou como chamado no R um vetor. 
a = 10
b = 12
# Eu tambem posso armazenar texto
c = "Terra"
d = "Quarentena"

# Os vetores podem ter diferentes classes. Numérica, Caracter, numero inteiro
class(a)
class(c)


#Eu posso realizar facilmente uma operaçao com vetores
a + b
b * a

# Posso tambem armazenar mais que 1 dado nesse vetor.
# Mas preciso utilizar a funçao concatenar 'c()'.
vetor1 = c(2,3,4,5,6,7) 
vetor2 = 10

vetor2 - vetor1

# Podemos criar sequencias aqui no R.

vetor3 = seq(from = 1, to = 2, length.out = 6)
vetor4 = seq(from = 0, to = 2.5, by = 0.5)

# Podemos repetir algum item tambem

vetor5 = rep("verao", 6)
vetor6 = rep(c("verao", "inverno"), each = 3)


#Podemos informar a distribuiçao e pedir que o R gere números aleatórios

vetor7 = runif(6,0,7)
length(vetor6)
vetor8 = rnorm(6,3,1)

# Aqui podemos tambem criar uma "Planilha" que no R é chamada de Data.frame
planilha = data.frame (vetor1, vetor2, vetor3, vetor4, vetor5, vetor6,vetor7,vetor8)

print(planilha)
#data.frames aceitam mais de 1 classe de vetor. Matrizes nao aceitam.

# MATRIZ
matriz = as.matrix(planilha)
matriz

#Qual o Problema?
#Oq houve?

#Vamos utilizar o nosso objeto planilha pra manipular data frames. 
# podemos selecionar dados de uma coluna chamando o objeto, colocando um $ e o nome da coluna. 

uniforme = planilha$vetor7
mean(uniforme)

#Outra forma de selecionar é através de indexaçao. Onde colocamos [,] após o nome do nosso objeto
# planilha[linhas,colunas]

planilha[3,] #pegamos a 3 linha inteira

planilha[,5] # Pegamos a 5 coluna inteira

planilha [3,4] # pegamos o valor que está na 3 linha e 4 coluna. 

# Agora usaremos os dados da planilha Iris no exemplo.

head(iris) # Essa funçao nos mostra as 5 primeiras linhas da planilha
str(iris) # essa funçao nos mostra a estrutura da planilha, ou seja, a classe de cada uma das variáveis. 

# Entao vamos começar a Manipular a planilha. Digamos que eu queira saber a média da largura das pétalas para cada espécie. 
# COMO FAÇO ISSO?
#Utilizo a funçao aggregate
aggregate(iris$Petal.Width~iris$Species, FUN = mean)

# EU posso armazenar essa informaçao?
(petala_largura_media = aggregate(iris$Petal.Width~iris$Species, FUN = mean))

#Vamos trocar o nome das colunas pra nao confundir 
colnames(petala_largura_media) <-  c("especie", "largura_media")
petala_largura_media

# VAmos adicionar tambem o desvio padrao nesse nosso data frame. 
petala_largura_desvpad = aggregate(iris$Petal.Width~iris$Species, FUN = sd)
colnames(petala_largura_desvpad) = c("especie","desvpad")

petala_largura_media$desvpad = petala_largura_desvpad$desvpad


#Exercício 1
# Crie um vetor com 40 números de 22 a 62.

#Exercício 2
# Crie um vetor N = 40 com as palavras Verao e Inverno 

#Exercício 3
# Crie um data.frame com 4 variáveis, 1 categórica, 3 contínuas.
## Com N = 40.

#Exercício 4
#Calcule a média e o desvio padrao para cada uma das variáveis. 

#Exercício 5
#Calcule a média e o desvio padrao para da variável considerando as categorias. 

#Exercício 6
# Utilizando a planilha iris, calcule a média e o desvio padrao do comprimento das sépalas.

#Exercício 7
# Qual é o valor 10 da 3 coluna?