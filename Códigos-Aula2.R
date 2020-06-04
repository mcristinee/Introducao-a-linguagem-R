## AULA 2
rm(list=ls())

#Leitura de daos .csv e .txt

algas <-  read.csv("metais_algas.csv", sep = "\t", dec=",", header = T)
head(algas)

algas <-  read.csv("metais_algas.csv", sep = ";", dec=",", header = T)
head(algas)

algas_subset <-  subset(algas, select = c("Grupo","Local.da.Coleta","NS","Estacao","Pb","Zn","As"))
head(algas_subset)

algas_num <-  algas[,-c(1:15)]
head(algas_num)

#USAR APPLY
apply(algas_num, 2, FUN = mean)



#USAR TAPPLY
tapply(algas_subset$Zn,INDEX = algas_subset$Estacao, FUN = sum)



#USAR AGGREGATE
aggregate(algas_subset$As~algas_subset$Estacao+algas_subset$Grupo, FUN =mean)

## AGORA Utilizando dados reais, vamos tentar selecionar e calcular alguns dados utilzando o que aprendemos na ultima aula

#Qual a classe da Coluna AS?
# e da coluna NS
# Rode a funçao str e explique a estrutura da tabela. 

# Agora vamos entender mais funçoes de manipulaçao de dados.

# E se eu quisesse analisar só os dados das Rhodophyta?

Rhodophyta = subset(algas, subset = (algas$Grupo == "Rhodophyta"))

#Agora veremos qual o valor máximo para As em algas vermelhas. Para o Verao e Para o Inverno

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = max )

# E qual o valor que representa 50% dos dados?

tapply(Rhodophyta$As, Rhodophyta$Estacao, FUN = median )

#################################################
# EXercícios aula 2

# Carrega a planilha metais_algas com o nome metais

# Selecione os dados de Inverno para algas rhodophyta.

# Qual a média de Pb por grupo?

# Utilize a funcáo aggregate para verificar os valores máximos de Zn para cada grupo em cada estaçao. 

# Utilize a funçao apply para calcular os valores médios para cada metal. Dica, tem que descartar os valores que nao sao numeros. 

# Qual o N amostral para Rhodophyta? E para Phaeophyceae?

# É possível montar uma planilha apenas com os dados de Phaeophyceae, no verao e na face Sul?
