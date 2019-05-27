####################################################################
# Projekt: Analyse Top 100 Singlecharts                            #
# Im Auftrag: RedaktionsNetzwerk Deutschland                       #
# Autor: Julius Heinrichs                                          #
# Mail: julius.heinrichs@web.de                                    #
# Stand: 28.05.2019                                                #
####################################################################


# Datensatz einlesen: 
charts <- read.csv2("Datensatz_Charts.csv", header = TRUE, sep = ";")

####################################################################
# Datensatz: Datensatz_Charts                                      #
#                                                                  #
# Der Datensatz enthält die Top100 Singlejahrescharts von 2014 bis #
# 2018. Variablen: Jahr, Position, Titel, Interpret, Geschlecht    #
# Interpret, Sprache des Titels, Genre des Titels                  # 
#                                                                  #
# Eigene Datenakkumulation                                         #
# Datenquelle: https://www.offiziellecharts.de/charts/single-jahr  #
# Vorgehen bei Datensatzerstellung und Codes siehe readme          #
####################################################################

# Bereinigung Datensatz: Löschung der leeren Spalten 8 und 9:
charts <- charts[, -c(8,9)]

# Deskriptive Analysen: Bedingte Häufigkeiten
# Frage 1: Wie hat sich der Anteil deutschsprachig gesungener Songs 
# entwickelt - nach Jahren?

table(charts$Jahr, charts$Deutsch)

# Grafische Auswertung: 
barplot(table(charts$Deutsch, charts$Jahr), 
        horiz = TRUE, 
        col = c("orangered4", "navyblue"),
        border = "white",
        space = 1,
        xlab = "Prozent", 
        ylab = "Jahr", 
        main = "Anteil deutschsprachiger Titel in der Top 100 Singlecharts")

# Ausgabe Daten für Redaktion: 
deutsch <- data.frame(table(charts$Jahr, charts$Deutsch))
colnames(deutsch) <- c("Jahr", "Deutsch", "Häufigkeit")
write.csv2(deutsch, file = "Deutsch.csv")

# Frage 2: Wie hat sich der Anteil von Singles entwickelt, deren 
# Interpreten ausschließlich Männer waren - nach Jahren?

table(charts$Jahr, charts$Geschlecht)

# Grafische Auswertung: 
barplot(table(charts$Geschlecht, charts$Jahr), 
        horiz = TRUE, 
        col = c("orangered4", "navyblue", "grey"),
        border = "white",
        space = 1,
        xlab = "Prozent", 
        ylab = "Jahr", 
        main = "Top 100 Singlecharts nach Geschlecht")

# Ausgabe Daten für Redaktion: 
geschl <- data.frame(table(charts$Jahr, charts$Geschlecht))
colnames(geschl) <- c("Jahr", "Geschlecht", "Häufigkeit")
write.csv2(geschl, file = "Geschlecht.csv")

# Frage 3: Wie hat sich der Anteil verschiedener Genre entwickelt - 
# nach Jahren?

table(charts$Jahr, charts$Genre)

# Grafische Auswertung: 
barplot(table(charts$Genre, charts$Jahr), 
        horiz = TRUE, 
        col = c("orangered4", "navyblue", "grey"),
        border = "white",
        space = 1,
        xlab = "Prozent", 
        ylab = "Jahr", 
        main = "Top 100 Singlecharts nach Genre")

# Ausgabe Daten für Redaktion: 
genre <- data.frame(table(charts$Jahr, charts$Genre))
colnames(genre) <- c("Jahr", "Genre", "Häufigkeit")
write.csv2(genre, file = "Genre.csv")

# Frage 4: Wie hoch ist der Anteil der Frauen nach Genre?
geschl_genre <- data.frame(table(charts$Genre, charts$Geschlecht))
colnames(geschl_genre) <- c("Genre", "Geschlecht", "Häufigkeit")
write.csv2(geschl_genre, file = "Geschlecht_Genre.csv")

# Ende. 


