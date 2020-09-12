# TP2

# section 2.1
n=100
mu=80
sd=5

#permet de simuler une loi normale
x=rnorm(n=n,mean = mu,sd = sd)

#Affiche un histogramme
hist(x, probability = TRUE, breaks=20, 
     xlab="Valeur simulée", ylab="Densité")

     
#distribution statistique
hist(x,breaks=30,
     col="green3",border="sienna",
     main=paste("Echantillon de taille de", length(x)),
     xlab="Valeur simulée", ylab="Densité",
     probability =TRUE, labels=FALSE , ylim=c(0,0.1), xlim=c(60,100))
#densité de probabilité
t=seq(from= 60, to=100, by=1)

lines(t,dnorm(t, mean=80, sd=5), col= "red", lwd= 5, lty=4)

mtext(paste("Ajustement à une loi normale, moy = ", round(mean(x),2))) 

# remarque : exemple de courbes de densité

plot(t,dnorm(t, mean=80, sd=5), type="l")
lines(t,dnorm(t, mean=80, sd=10), col= "red", lwd= 5, lty=4)

lines(t,dnorm(t, mean=80, sd=3), col= "blue", lwd= 5, lty=4)


# section 3.1 Loi des grands nombres

# paramètres
pas=10
nmin=1
nmax=500

taille=seq(nmin,nmax,pas)

# exemple échantillon loi normale
ech=rnorm(nmax,mu,sd)

# exemple échantillon loi de poisson
# ech=rpois(n=nmax,lambda=mu)

# boucle pour calculer la moyenne des obs sur les i premières valeurs
xbar=array(0,length(taille))

for (i in 1:length(taille)){
   xbar[i]=mean(ech[1:taille[i]])
   }

plot(taille,xbar,type="l",
     main="Illustration de la Loi des grands nombres",
     ylim=c(75,85),
     xlab="Taille échantillon",
    ylab="Moyenne observée")
abline(h=80,col=2,lwd=2)
abline(v=30,col="green",lwd=2)
abline(v=100,col="green",lwd=2)


#section 3.3 TCL
# tirage de K échantillons, chacun de taille n
K=10000 # faire varier

n=100 # faire varier

#Espérance mu et variance sigma2 d'une loi uniforme sur [0,1]
mu=1/2
sigma2=1/12

lbd=5
mu=lbd
sigma2=lbd

# vecteur de la moyenne observée (centrée réduite) sur chacun des K échantillons
vect=rep(0,K)

# Boucle sur chacun des K échantillons
# >> calcul de la moyenne observée, centrée réduite
# nb : la variance de la variable aléatoire moyenne vaut sigma2/n 
for (i in 1 : K) {
#!#  moy=mean(runif(n))
  moy=mean(rpois(n=n, lambda=lbd))
  vect[i]=(moy-mu)/sqrt(sigma2/n)
}
# Histogramme de la distribution statistique
hist(vect, col="blue", probability=T, ylim=c(0,0.5),xlim=c(-4,4), breaks = 30)


# Ajout de la courbe de  densité de probabilité de la loi normale centrée réduite
curve(dnorm(x,mean=0,sd=1),add=T, col="green", lwd=2)

# Ajout d'une courbe estimée par méthode du noyau 
# lines(density(vect), col="red", lwd=2)



