# Aula 3 - Manhã = Analises Exploratorias
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
}

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
round(dados,2)

getwd()
write.table(dados, file = "descritiva_metais.csv", sep = ";", dec = ",")
read.table("descritiva_metais.csv", sep=";", dec = ",")


#Exercícios
#Faça uma análise descritiva da planilha (Iris), 
##descreva os principais parâmetros totais e por espécie.


#Salve esses dados em planilhas chamadas - Descritiva_sp1.csv


# Graficos
hist(algas_exp)

hist(algas_exp$N)
boxplot(algas_exp$N)

qqnorm(algas_exp$N)
qqline(algas_exp$N)

#Separado
aggregate(algas_N$N~algas_N$Estacao+algas$Grupo, FUN = mean)

boxplot(algas_exp$N~algas_exp$Estacao+algas_exp$Grupo)
qqnorm(algas_exp$N[algas_exp$Grupo == 'Phaeophyceae'])
qqline(algas_exp$N[algas_exp$Grupo == 'Phaeophyceae'])


boxplot(algas_exp$N~algas_exp$Estacao+algas_exp$Grupo)

library(sciplot)
bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo)

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20))

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20), ylab = "Concentracao")

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20), ylab = "Concentracao", xlab = "Estacao")



Grupo = table(algas_exp$Grupo)
SP = table(algas_exp$Especie.e.Genero)
NS = table(algas_exp$NS)
Estacao= table(algas_exp$Estacao)

barplot(Grupo)


# Utilizando a planilha Iris. 

#COnsiga os principais parametros de comprimento de pÃ©tala.
## MÃ©dia, Mediana, DesvPad, Maximo e Minimo.
#HÃ¡ alguma outra medida que podemos extrair dos dados?

## FaÃ§a um Boxplot para comprimento da sÃ©pala e outro para comprimento da pÃ©tala. 

## FaÃ§a um Histograma com os dados de largura de sÃ©pala. 

# Construa um grÃ¡fico com margens = 3, aumento dos eixos e um tÃ­tulo. 
#Use as cores, azul, verde e vermelho. Os dados SÃ£o so do Data.Frame abaixo
A = runif(30,10,20)
B = runif(30,20,30)
C = runif(30,30,40)
(para_grafico = c(A,B,C))

cores=rep(c("green","blue","red"), each = 30)

plot(para_grafico, col = cores, pch = rep(c(17,15,16),each = 30))

     