# ________________________TP2__________________________


# Data frame à partir d’un fichier csv
ozone=read.csv2("ozone.csv") #
# vérification
summary(ozone)
attach(ozone)

reg6v = lm(maxO3~maxO3v+T9+Vx12+T12+Ne12+Vx15+Ne15, data=ozone)

reg_back=step(reg6v, direction = "backward")
reg_back

reg_both=step(reg6v, direction = "both")
reg_both

reg_1v = lm()

reg_for=step(reg6v, direction = "forward")
reg_for

#1
install.packages("leaps")
library(leaps)
exemple= regsubsets(maxO3~maxO3v+T12+Ne12+Vx15, data=ozone)

plot(exemple, scale="bic")

plot(exemple,scale="Cp")