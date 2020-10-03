#tp2 Modèle linéaire, simulation modèle ANOVA

betaZero=2
betaUn=5
betaDeux=3
betatrois=1
n=100
#simuler F à 3 niveau possible

F = factor(sample(c("A","B","C"),n,replace=TRUE))

epsilon = rnorm(n,0,1)

y=betaZero+betaDeux*(F=="B")+betatrois*(F=="C")+epsilon

model.matrix(y~F)
#lm(y~F)
BetaZeroChapeau = mean(y[F=="A"]) # est égal à BetaZeroChapeau!
BetaDeuxCHapeau = mean(y[F=="B"]) -BetaZeroChapeau
BetaTroisChapeau = mean(y[F=="C"]) -BetaZeroChapeau

newF = relevel (F,"B")

lm(y~newF)

lm(y~F,contrast = list(F="contr.sum"))

mean(y[F=="C"])

