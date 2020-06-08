### AULA 4 - ANOVA e Regressão. 
#Regressão Linear
rm(list=ls())
nutrientes <- c(1,1,1,3,3,3,6,6,6,9,9,9,12,12,12,15,15,15)
peso <- c(10,8,9, 12,11,13,15,13,12,16,17,15,18,19,18,20,19,18)

par(cex.axis=1.4,cex.lab=1.4,las=1,bty="l", tcl=0.3,pch=16,cex=1.4,family = "serif")
plot(peso~nutrientes, xlab="", ylab="Peso(g)")
mtext(expression(µg.L^{-1}), side = 1, line = 4.2, cex = 1.5)
mtext('Nutrientes', side = 1, line = 3, cex = 1.5)
text(locator(1), "0.71A + 9.72")

#plotar linha de regressão
reg <- lm(peso~nutrientes) 
summary(reg)
abline (reg, col = "red")

#plotar o valor da correlação de Pearson
legend("bottomright", bty="n", legend="r 0.95", cex = 1.2)


babies <-  read.csv("babies.csv", sep =";")
babies

fumo = lm(babies$weight~babies$bwt+babies$gestation)
summary(fumo)

par(mfrow = c(1,2))
boxplot(babies$weight~babies$smoke, outline = F)
boxplot(babies$weight~babies$smoke, outline = T)



conc.PO4 <-  c(1,2,3,4,5,6,7,8)
abs <-  c(0.2,0.36,0.6,0.72,1,1.2,1.23,1.6)
length(abs)
conc = lm(conc.PO4~abs)
summary(conc)
plot(conc.PO4~abs, pch = 16)
abline(conc, col = 2)


## Teste T - Vamos trabalhar com dados hipotéticos de peso de macroalgas
Rhodophyta = rnorm(30,9,1)
Phaeophyceae = rnorm(30,13,1)
algas = data.frame(Rhodophyta,Phaeophyceae)

head(algas) # Primeiro verificamos a estrutura dos dados

boxplot(algas)

media.algas = apply(algas,2,mean)
vetor.obs=1:60
vetor.dados=c(Rhodophyta, Phaeophyceae)
media.geral=mean(c(Rhodophyta,Phaeophyceae))
media.geral
dif.geral=algas-media.geral
dif.geral
sum(dif.geral)
round(sum(dif.geral),10)
ss.algas=dif.geral^2
ss.algas
ss.total=sum(ss.algas)
ss.total
vetor.cor<-rep(1:2, each=30)
vetor.medias<-rep(media.algas, each=30)
####GRAFICOS
plot(vetor.obs,vetor.dados,ylim=c(0,20),pch=(rep(c(15,16),each=30)),col=vetor.cor,ylab="Variável Resposta", xlab="Observações")
for(i in 1:60)
{
  lines(c(i,i),c(vetor.dados[i],mean(vetor.dados)),col=vetor.cor[i])
}
abline(h=media.geral)

#GRAFICO INTRA GRUPOS
plot(vetor.obs,vetor.dados,ylim=c(0,20),pch=(rep(c(15,16),each=30)),col=vetor.cor,main="Variação Intra Grupos",ylab="Variável Resposta", xlab="Observações")
for(i in 1:60)
{
  lines(c(i,i),c(vetor.medias[i],vetor.dados[i]),col=vetor.cor[i])
}
lines(c(1,30),c(media.algas[1],media.algas[1]),col=1)
lines(c(31,60),c(media.algas[2],media.algas[2]),col=2)


## FAZENDO O TESTE
shapiro.test(Rhodophyta)
shapiro.test(Phaeophyceae)

bartlett.test(c(Rhodophyta,Phaeophyceae), grupo)

t.test(c(Rhodophyta,Phaeophyceae)~ grupo)



##ANOVA NA UNHA _ AULA DA DISCIPLINA DO PROF ALEXANDRE ADALARDO.
Chlorophyta = rnorm(30,18,2)
Rhodophyta = rnorm(30,9,1)
Phaeophyceae = rnorm(30,13,1)
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
plot(vetor.obs,vetor.dados,ylim=c(0,30),pch=(rep(c(15,16,17),each=30)),col=vetor.cor,ylab="Variável Resposta", xlab="Observações")
for(i in 1:90)
{
  lines(c(i,i),c(vetor.dados[i],mean(vetor.dados)),col=vetor.cor[i])
}
abline(h=media.geral)

#GRAFICO INTRA GRUPOS
plot(vetor.obs,vetor.dados,ylim=c(0,30),pch=(rep(c(15,16,17),each=30)),col=vetor.cor,main="Variação Intra Grupos",ylab="Variável Resposta", xlab="Observações")
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


plot(vetor.obs,vetor.medias,ylim=c(5,20),pch=(rep(c(15,16,17),each=30)),col=vetor.cor,main="Variação Entre Grupos",ylab="Variável Resposta", xlab="Observações")
for(i in 1:90)
{
  lines(c(i,i),c(vetor.medias[i],mean(vetor.medias)),col=vetor.cor[i])
}
abline(h=media.geral)
points(vetor.obs,vetor.dados,ylim=c(0,20),pch=(rep(c(0,1,2),each=30)),col=vetor.cor,cex=0.5)

#### Cálculo dos valores

media.algas=apply(algas,2,mean)
media.algas
media.geral
ss.entre=10*sum((media.algas-media.geral)^2)
ss.entre

ss.intra+ss.entre
ss.total

ms.entre=ss.entre/2
ms.intra=ss.intra/87
ms.entre
ms.intra
F.algas=ms.entre/ms.intra
F.algas
p.algas=pf(F.algas,2,87, lower.tail=FALSE)
p.algas

grupo = rep(c("Chlorophyta","Rhodophyta","Phaeophyceae"),each=30)


anv = aov(c(Chlorophyta,Rhodophyta,Phaeophyceae)~grupo)
summary(anv)
TukeyHSD(anv)
