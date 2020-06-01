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

#Todos esses calculos apareceram no terminal. Mas e se eu quiser armazenar em algum lugar pra usar depois em outro cálculo?
#Entao eu uso um 'objeto' ou como chamado no R um vetor. 
a = 10
b = 12

#Eu posso realizar facilmente uma operaçao com vetores
a + b
b * a

# Posso tambem armazenar mais que 1 dado nesse vetor.
# Mas preciso utilizar a funçao concatenar 'c()'.
vetor1 = c(2,3,4,5,6) 
vetor2 = 10

vetor2 - vetor1

# Podemos criar sequencias aqui no R.

vetor3 = seq(from = 1, to = 2, length.out = 5)
vetor4 = seq(from = 0, to = 2, by = 0.5)

# Podemos repetir algum item tambem

vetor5 = rep("verao", 5)
vetor6 = rep(c("verao", "inverno"), each = 2)

# Aqui podemos tambem criar uma "Planilha" que no R é chamada de Data.frame
planilha = data.frame (vetor1, vetor2, vetor3, vetor4, vetor5)

print(planilha)



#Exercício 1

# Crie uma planilha com 4 variáveis, 2 categóricas, 2 contínuas.
## Com N = 20.
