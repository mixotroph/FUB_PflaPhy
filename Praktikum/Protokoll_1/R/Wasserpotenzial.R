# Daten einlesen
Table_1 <- read.csv("~/Uni/Biologie/Pflanzenphysiologie/Praktikum/Protokoll_1/R/Versuch_1.1.csv")
par(las=1)

# Spline zur Interpolation der Messwerte berechnen
ispl <-interpSpline(Table_1$"molar",Table_1$"delta")

# Graph zeichnen
plot( 
      Table_1$"molar",Table_1$"delta",
      #type="l",
      #ispl,
      lty=1,
      lwd=1,
      col="grey60",
      ylim=c(-20,10),
      xlab="Osmolalität der Testlösung",
      ylab="Frischmasse (Ab- bzw. Zunahme) [%]")
points( Table_1$"molar",Table_1$"delta" )

# Regressionsgerade berechnen
fm <- lm(Table_1$"delta"~Table_1$"molar")
abline(fm,col = "blue")

# Nullline
abline(h = 0, v = 0, col = "gray60")

# Titel
title(main="Wasserpotential von Kartoffelparenchym", font.main=2)

#Labels für Legende
labelsL1=expression(paste("Osmolalität"))
labelsL2=expression(paste("y=85,66x+20,09        "))

#Legende
legend("topright", c(labelsL2), col=c("blue"), lty=1)