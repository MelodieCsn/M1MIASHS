# Data frame à partir d’un fichier csv
ozone=read.csv2("ozone.csv") #
# vérification
summary(ozone)

# avant de faire régression on regarde la correlation entre les var explicatives 
#et on enlève celles qui sont trop corrélées
attach(ozone)
X=cbind(rep(1,112),maxO3v,T12,Ne12,Vx15)
dim(X)
round(cor(X),2)

#1
reg=lm(maxO3~maxO3v+T12+Ne12+Vx15, data=ozone)
summary(reg)
plot(reg)

#2
attach(ozone)
res=maxO3 - reg$fitted.values
res = reg$residuals

#3 graphe des résidus par ordre du num d'observation
plot(reg$residuals)
abline(a=0,b=1,lty=2, col=2)

# résidus en fonction de Ychap
plot(reg$fitted.values, reg$residuals)
abline(h=0,col=2)

# résidus en fonction des var explicatives
plot(maxO3,reg$residuals)
plot(T9, reg$residuals)

#boucle sur les var explicatives

noms=c('maxO3v','T12','Ne12','Vx15')
pos=c(12,4,7,11)
for(v in pos){
  plot(x=ozone[,v],y=res,main=names(ozone[v]))
  abline(h=0, lty=2, col=2, lwd=2)
}

#4 H=X(X'X)^(-1)X'
H=X%*%solve(t(X)%*%X)%*%t(X)
dim(H)

#comparaison entre la matrice H et la fonction influence

inf<-influence(reg)
inf$hat # meme chose que diagonale de H

seuil = 2* dim(X)[2]/dim(X)[1]
plot(diag(H))
abline(h=seuil,col=3)

#5 résidus standardisés

sigma2chap = sum(reg$residuals^2)/(dim(X)[1]-dim(X)[2]-1)
rstand= reg$residuals/sqrt(sigma2chap*(1-diag(H)))

plot(reg$fitted.values,rstand,main = "résidus standardisés")
abline(h=2,col=3)
abline(h=-2, col=3)

# Autre méthode avec une fonction qui existe déjà
rstandard(reg)

# 6 erreur de test (on enlève un individu, on entrine le modèle sans et on regarde si on a une bonne prédiction)

errtest = reg$residuals/(1-diag(H))

PRESS = sum(errtest^2)

# résidus studentisés

sigma2chaptest =  sum(errtest^2)/(dim(X)[1]-dim(X)[2]-1)
rstud = reg$residuals/sqrt(sigma2chaptest*(1-diag(H)))

plot(reg$fitted.values,rstud,main = "résidus standardisés")
abline(h=2,col=3)
abline(h=-2, col=3)

# 8 Distance de cook

Dcooks = cooks.distance(reg)
plot(Dcooks)

#9 Q-Q plot on compare les quantiles d'une loi normale aux quantiles des résidus
# ils sont sencés etre les mêmes

echgauss = rnorm(n=1000,mean=0,sd=1)

qqplot(rstand,echgauss)
abline(a=0,b=1, col=2)