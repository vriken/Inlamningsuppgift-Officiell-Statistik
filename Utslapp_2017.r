library("ggplot2")
data <- read.csv("https://raw.githubusercontent.com/vriken/Inlamningsuppgift-Officiell-Statistik/master/Data/0000018Q_20201103-131900.csv")
ggplot2::theme_set(ggplot2::theme_bw())

ggplot(data, aes(x = växthusgas,
                 y = X2017, 
                 fill = sektor,
                 color = sektor)) +
geom_curve()