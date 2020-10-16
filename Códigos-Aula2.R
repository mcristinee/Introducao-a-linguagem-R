

# Analises Exploratorias e Graficos
# Aula 2

rm(list=ls())
#install.packages("sciplot")
library("sciplot")

algas = read.csv("metais_algas.csv", sep = ";", dec = ",")
head(algas)
length(algas$As)

algas$N = rnorm(82,12,3)

# AnÃ¡lise exploratÃ³ria. 
# DISTRIBUICAO
# MEDIA; MEDIANA; DESVIO PADRAO; MAX; MINIMO; 
# GrÃ¡ficos - Histograma, BoxPlot, DIspersao.

# PARA Essas ANÃ¡lises vamos fazer um subset com os dados de metais, sal, temp, Especies, Grupos, Locais, Face e EstaÃ§ao do Ano

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

# GrÃ¡ficos
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

# Qual a mÃ©dia de Pb por grupo?

# Utilize a funcÃ¡o aggregate para verificar os valores mÃ¡ximos de Zn para cada grupo em cada estaÃ§ao. 

# Utilize a funÃ§ao apply para calcular os valores mÃ©dios para cada metal. Dica, tem que descartar os valores que nao sao numeros. 

# Qual o N amostral para Rhodophyta? E para Phaeophyceae?

# E possivel montar uma planilha apenas com os dados de Phaeophyceae, no verao e na face Sul?


