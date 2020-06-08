# Introducao a linguagem R
Workshop de Introduçao ao uso da Linguagem R em análises ecológicas.


Para o início das nossas atividades precisaremos instalar o R em nossos computadores.   
    Ele é Open-Source, ou seja, não há cobranças para sua utilizaçao e podemos encontrá-lo nesse link. 
    https://www.r-project.org/

Nesse Curso, utilizaremos o R-Studio. 
    Esse programa facilita o uso e aprendizado do R. 
    Ele também é gratuito e podemos encontrá-lo nesse link.
    https://rstudio.com/



### AULA 4 - ANOVA e Regressão. 
#Regressão Linear
rm(list=ls())
dev.off()

nutrientes <- c(1,1,1,3,3,3,6,6,6,9,9,9,12,12,12,15,15,15)
peso <- c(10,8,9, 12,11,13,15,13,12,16,17,15,18,19,18,20,19,18)

par(cex.axis=1.4,cex.lab=1.4,las=1,bty="l", tcl=0.3,pch=16,cex=1.4,family = "serif")
plot(peso~nutrientes, xlab="", ylab="Peso(g)")
mtext(expression(µg.L^{-1}), side = 1, line = 4.2, cex = 1.5)
mtext('Nutrientes', side = 1, line = 3, cex = 1.5)
text()

#plotar linha de regressão
reg <- lm(peso~nutrientes) 
abline (reg, col = "red")

#plotar o valor da correlação de Pearson
legend("bottomright", bty="n", legend="r 0.95", cex = 1.2)

# o summary da regressão nos dá o coeficiênte de determinação que também pode ser plotado
summary(reg)

#plotar o coeficiente de determinação
legend("topleft", bty="n", legend=paste("r² 0,91"), cex = 1.2)

reg






##ANOVA NA UNHA _ AULA DA DISCIPLINA DO PROF ALEXANDRE ADALARDO.

are=c(6,10,8,6,14,17,9,11,7,11)
are
arg=c(17,15,3,11,14,12,12,8,10,13)
arg
hum=c(13,16,9,12,15,16,17,13,18,14)
hum
solos=data.frame(are,arg,hum)
solos
str(solos)
boxplot(solos)
media.solos<-apply(solos,2,mean)
vetor.obs=1:30
vetor.dados=c(are,arg,hum)
media.geral=mean(c(are,arg,hum))
media.geral
dif.geral=solos-media.geral
dif.geral
sum(dif.geral)
round(sum(dif.geral),10)
ss.solos=dif.geral^2
ss.solos
ss.total=sum(ss.solos)
ss.total
vetor.cor<-rep(1:3, each=10)
vetor.medias<-rep(media.solos, each=10)
####GRAFICOS
plot(vetor.obs,vetor.dados,ylim=c(0,20),pch=(rep(c(15,16,17),each=10)),col=vetor.cor,ylab="Variável Resposta", xlab="Observações")
for(i in 1:30)
{
  lines(c(i,i),c(vetor.dados[i],mean(vetor.dados)),col=vetor.cor[i])
}
abline(h=media.geral)

#GRAFICO INTRA GRUPOS
plot(vetor.obs,vetor.dados,ylim=c(0,20),pch=(rep(c(15,16,17),each=10)),col=vetor.cor,main="Variação Intra Grupos",ylab="Variável Resposta", xlab="Observações")
for(i in 1:30)
{
  lines(c(i,i),c(vetor.medias[i],vetor.dados[i]),col=vetor.cor[i])
}
lines(c(1,10),c(media.solos[1],media.solos[1]),col=1)
lines(c(11,20),c(media.solos[2],media.solos[2]),col=2)
lines(c(21,30),c(media.solos[3],media.solos[3]),col=3)

#CALCULOS
solos
media.solos
ss.are=sum((are-media.solos["are"])^2)
ss.are
ss.arg=sum((arg-media.solos["arg"])^2)
ss.arg
ss.hum=sum((hum-media.solos["hum"])^2)
ss.hum
ss.intra=ss.are+ss.arg+ss.hum
ss.intra


plot(vetor.obs,vetor.medias,ylim=c(5,16),pch=(rep(c(15,16,17),each=10)),col=vetor.cor,main="Variação Entre Grupos",ylab="Variável Resposta", xlab="Observações")
for(i in 1:30)
{
  lines(c(i,i),c(vetor.medias[i],mean(vetor.medias)),col=vetor.cor[i])
}
abline(h=media.geral)
points(vetor.obs,vetor.dados,ylim=c(0,20),pch=(rep(c(0,1,2),each=10)),col=vetor.cor,cex=0.5)

#### Cálculo dos valores

media.solos=apply(solos,2,mean)
media.solos
media.geral
ss.entre=10*sum((media.solos-media.geral)^2)
ss.entre

ss.intra+ss.entre
ss.total

ms.entre=ss.entre/2
ms.intra=ss.intra/27
ms.entre
ms.intra
F.solos=ms.entre/ms.intra
F.solos
p.solos=pf(F.solos,2,27, lower.tail=FALSE)
p.solos


####GRAFICOS
curve(expr=df(x, 2,27),main="Distribuição F de Fisher (df=2,27)", xlab="Valor F",ylab="Densidade Probabilística (df)",xlim=c(0,10))
abline(v=F.solos,col="red")
abline(h=0, lty=2)
xf=seq(F.solos,10,0.01)
ydf=df(xf,2,27)
polygon(c(F.solos,xf),c(0,ydf),col="red")
text(locator(1),paste("pf(x) =",round(pf(F.solos,2,27,lower.tail=F),4)),cex=0.8, col="red")



