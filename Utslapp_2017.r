library("ggplot2")
library("RColorBrewer")
# här hämtar jag hem libaries som jag behöver för att göra detta skript
data <- read.csv("https://raw.githubusercontent.com/vriken/Inlamningsuppgift-Officiell-Statistik/master/Data/Totala_utslapp.csv")
# här hämtar jag datat som jag ska använda för att visualisera och döper det till "data"
data <- tail(data, -4)
#här tar jag bort de första fyra raderna från datat, eftersom det är nationella totala som inte behövs
ggplot2::theme_set(ggplot2::theme_bw())
#här sätter jag ett globalt theme så att bakgruden blir vit, m.m.

ggplot(data, aes(x = växthusgas,
                 y = X2017, 
                 fill = sektor,
                 color = sektor)) +
  #här skapar jag ett ggplot objekt som använder sig av dataobjektet som vi skapade på rad 5
  # jag använder mig också av aes funktionen. Där jag sätter x-axeln till olika slags växthusgaser,
  # och y till tyngderna av de olika växthusgaserna under 2017
  # jag fyller också fägerna för varje enskild sektor så att man tydligt ser vad det är som släpper ut vad,
  #och hur mycket
  
  labs(caption = "Källa: SCB",
       title = "Redovisning av de totala utsläppen i Sverige 2017") +
  #här skapar jag en titel, och en fotnot.
  
  xlab("Växthusgaser") +
  ylab("Antal i 1000kg") +
  #här ändrar jag titlarna för x, och y-axlarna
  
  scale_y_continuous(breaks = c(-50000, -25000, 0, 25000, 50000, 75000,
                                100000, 125000, 150000, 175000, 200000)) +
  #här bestämmer jag hur skalan på y-axeln ska se ut
  
  theme(axis.title.y = element_text(angle = 0,
                                    vjust = 0.6,
                                    size = 11),
        axis.text.y = element_text(size = 11),
        axis.text.x = element_text(size = 11),
        legend.text = element_text(size = 8.5),
        plot.caption = element_text(size = 9, hjust = 0, face = "italic", color = "navy")) +
  #här sätter jag lite diverse egenskaper för texten i grafen så att den ska vara läsbar i rapporten.
  
geom_bar(stat = "identity", color = "black", width = 1)
#här ropar jag på geom_bar så att grafen ritas ut med ggplot objektet, med svarta outlines. Och lite bredare
#än vanligt