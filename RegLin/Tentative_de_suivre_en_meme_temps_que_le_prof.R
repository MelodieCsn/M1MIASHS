x0=rep(1,10)
x1=c(2,2,0,0,0,1,0,0,2,0)
x2=c(17,20,21,18,31,34,20,17,48,16)
x3=c(52,56,27,34,29,38,38,25,53,36)

X=cbind(x0,x1,x2,x3)
y=c(21,26,37,40,35,37,35,26,42,38)

#solve Donne l'inverse d'une matrice
t(X)%X
t(X)%*%y

betac=Ainv%*%t(X)%*%y
betac

yc=X%*%betac
epsilon=y-yc
