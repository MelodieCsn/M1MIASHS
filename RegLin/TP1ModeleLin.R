#tp1 Modèle linéaire

betaZero=2
betaUn=-5
n=100

#simuler epsilon
epsilon = rnorm(n,0,1)
s = rnorm(n,3,1)

Y=betaZero + betaUn*s + epsilon


X=cbind(rep(1,n),s)

betaChapeau = solve(t(X)%*%X)%*%t(X)%*%Y

lm(Y~s)
#Affiche directement la matrice X, attention intercept par défault, mettre -1 pour pas l'avoir
model.matrix(Y~s-1)

mean(Y) #doit etre egal à
betaChapeau(0)+betaChapeau(1)*mean(s)

