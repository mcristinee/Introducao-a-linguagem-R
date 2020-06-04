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


