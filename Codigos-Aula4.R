### AULA 4 - ANOVA e Regressão. 
#Regressão Linear
rm(list=ls())
nutrientes <- c(1,1,1,3,3,3,6,6,6,9,9,9,12,12,12,15,15,15)
peso <- c(10,8,9, 12,11,13,15,13,12,16,17,15,18,19,18,20,19,18)

par(cex.axis=1.4,cex.lab=1.4,las=1,bty="l", tcl=0.3,pch=16,cex=1.4,family = "serif")

plot(peso~nutrientes, xlab="", ylab="Peso(g)")
mtext(expression(µg.L^{-1}), side = 1, line = 4.2, cex = 1.5)
mtext('Nutrientes', side = 1, line = 3, cex = 1.5)
text(4,20, "0.71A + 9.72")

#plotar linha de regressão
reg <- lm(peso~nutrientes) 
summary(reg)
abline (reg, col = "red")

# Plotar o valor do coeficiente de determinação
text(13,9,"R2 = 0,906",cex = 1.3)


conc.PO4 <-  c(1,2,3,4,5,6,7,8)
abs <-  c(0.2,0.36,0.6,0.72,1,1.2,1.23,1.6)
length(abs) == length(conc.PO4)
reg = lm(conc.PO4~abs)
summary(reg)
plot(conc.PO4~abs, pch = 16)
abline(reg, col = 2)




## Teste T - Vamos trabalhar com dados hipotéticos de peso de macroalgas
Rhodophyta = rnorm(100,9,2)
Phaeophyceae = rnorm(100,4,2)
algas = data.frame(Rhodophyta,Phaeophyceae)

head(algas) # Primeiro verificamos a estrutura dos dados

boxplot(algas, col = c("brown", "yellow"))


## FAZENDO O TESTE
grupo = rep(c("Rhodophyta","Phaeophyceae"), each = 100)
shapiro.test(Rhodophyta)
shapiro.test(Phaeophyceae)

bartlett.test(c(Rhodophyta,Phaeophyceae), grupo)

t.test(c(Rhodophyta,Phaeophyceae)~ grupo)



##ANOVA NA UNHA _ AULA DA DISCIPLINA DO PROF ALEXANDRE ADALARDO.
Chlorophyta = rnorm(30,18,1)
Rhodophyta = rnorm(30,24,1)
Phaeophyceae = rnorm(30,21,1)
algas = data.frame(Chlorophyta,Rhodophyta,Phaeophyceae)
algas
str(algas)
boxplot(algas)
media.algas<-apply(algas,2,mean)
vetor.obs=1:90
vetor.dados=c(Chlorophyta,Rhodophyta,Phaeophyceae)
media.geral=mean(c(Chlorophyta,Rhodophyta,Phaeophyceae))
media.geral
dif.geral=algas-media.geral
dif.geral
sum(dif.geral)
round(sum(dif.geral),10)
ss.algas=dif.geral^2
ss.algas
ss.total=sum(ss.algas)
ss.total
vetor.cor<-rep(1:3, each=30)
vetor.medias<-rep(media.algas, each=30)
####GRAFICOS
plot(vetor.obs,vetor.dados,ylim=c(0,30),pch=(rep(c(15,16,17),each=30)),col=vetor.cor,ylab="VariÃ¡vel Resposta", xlab="ObservaÃ§Ãµes")
for(i in 1:90)
{
  lines(c(i,i),c(vetor.dados[i],mean(vetor.dados)),col=vetor.cor[i])
}
abline(h=media.geral)

#GRAFICO INTRA GRUPOS
plot(vetor.obs,vetor.dados,ylim=c(0,30),pch=(rep(c(15,16,17),each=30)),col=vetor.cor,main="VariaÃ§Ã£o Intra Grupos",ylab="VariÃ¡vel Resposta", xlab="ObservaÃ§Ãµes")
for(i in 1:90)
{
  lines(c(i,i),c(vetor.medias[i],vetor.dados[i]),col=vetor.cor[i])
}
lines(c(1,30),c(media.algas[1],media.algas[1]),col=1)
lines(c(31,60),c(media.algas[2],media.algas[2]),col=2)
lines(c(61,90),c(media.algas[3],media.algas[3]),col=3)

#CALCULOS
algas
media.algas
ss.chlo=sum((Chlorophyta-media.algas["Chlorophyta"])^2)
ss.chlo
ss.rho=sum((Rhodophyta-media.algas["Rhodophyta"])^2)
ss.rho
ss.pha=sum((Phaeophyceae-media.algas["Phaeophyceae"])^2)
ss.pha
ss.intra=ss.chlo+ss.rho+ss.pha
ss.intra


plot(vetor.obs,vetor.medias,ylim=c(5,40),pch=(rep(c(15,16,17),each=30)),col=vetor.cor,main="VariaÃ§Ã£o Entre Grupos",ylab="VariÃ¡vel Resposta", xlab="ObservaÃ§Ãµes")
for(i in 1:90)
{
  lines(c(i,i),c(vetor.medias[i],mean(vetor.medias)),col=vetor.cor[i])
}
abline(h=media.geral)
points(vetor.obs,vetor.dados,ylim=c(0,20),pch=(rep(c(0,1,2),each=30)),col=vetor.cor,cex=0.5)

grupo = rep(c("Chlorophyta","Rhodophyta","Phaeophyceae"),each=30)

pesos = c(Chlorophyta,Rhodophyta,Phaeophyceae)

shapiro.test(pesos)
hist(pesos)


anv = aov(c(Chlorophyta,Rhodophyta,Phaeophyceae)~grupo)
summary(anv)
TukeyHSD(anv)
