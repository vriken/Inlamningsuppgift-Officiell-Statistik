library("ggplot2")
library("RColorBrewer")
# h�r h�mtar jag hem libaries som jag beh�ver f�r att g�ra detta skript
data <- read.csv("https://raw.githubusercontent.com/vriken/Inlamningsuppgift-Officiell-Statistik/master/Data/Totala_utslapp.csv")
# h�r h�mtar jag datat som jag ska anv�nda f�r att visualisera och d�per det till "data"
data <- tail(data, -4)
#h�r tar jag bort de f�rsta fyra raderna fr�n datat, eftersom det �r nationella totala som inte beh�vs
ggplot2::theme_set(ggplot2::theme_bw())
#h�r s�tter jag ett globalt theme s� att bakgruden blir vit, m.m.

ggplot(data, aes(x = v�xthusgas,
                 y = X2017, 
                 fill = sektor,
                 color = sektor)) +
  #h�r skapar jag ett ggplot objekt som anv�nder sig av dataobjektet som vi skapade p� rad 5
  # jag anv�nder mig ocks� av aes funktionen. D�r jag s�tter x-axeln till olika slags v�xthusgaser,
  # och y till tyngderna av de olika v�xthusgaserna under 2017
  # jag fyller ocks� f�gerna f�r varje enskild sektor s� att man tydligt ser vad det �r som sl�pper ut vad,
  #och hur mycket
  
  labs(caption = "K�lla: SCB",
       title = "Redovisning av de totala utsl�ppen i Sverige 2017") +
  #h�r skapar jag en titel, och en fotnot.
  
  xlab("V�xthusgaser") +
  ylab("Antal i 1000kg") +
  #h�r �ndrar jag titlarna f�r x, och y-axlarna
  
  scale_y_continuous(breaks = c(-50000, -25000, 0, 25000, 50000, 75000,
                                100000, 125000, 150000, 175000, 200000)) +
  #h�r best�mmer jag hur skalan p� y-axeln ska se ut
  
  theme(axis.title.y = element_text(angle = 0,
                                    vjust = 0.6,
                                    size = 11),
        axis.text.y = element_text(size = 11),
        axis.text.x = element_text(size = 11),
        legend.text = element_text(size = 8.5),
        plot.caption = element_text(size = 9, hjust = 0, face = "italic", color = "navy")) +
  #h�r s�tter jag lite diverse egenskaper f�r texten i grafen s� att den ska vara l�sbar i rapporten.
  
geom_bar(stat = "identity", color = "black", width = 1)
#h�r ropar jag p� geom_bar s� att grafen ritas ut med ggplot objektet, med svarta outlines. Och lite bredare
#�n vanligt