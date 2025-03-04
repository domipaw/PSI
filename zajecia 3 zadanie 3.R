# Instalacja i ³adowanie wymaganych pakietów ----
#install.packages(c("tm", "wordcloud", "RColorBrewer", "ggplot2"))
library(tm)
library(wordcloud)
library(RColorBrewer)
library(ggplot2)


# Stworzenie funkcji do przetwarzania tekstu ----
process_text <- function(file_path) {
  # Wczytanie tekstu z pliku
  text <- tolower(readLines(file_path, encoding = "UTF-8"))
  # Usuniêcie znaków interpunkcyjnych i cyfr
  text <- removePunctuation(text)
  text <- removeNumbers(text)
  # Usuniêcie stop s³ów angielskich
  text <- removeWords(text, stopwords("en"))
  # Podzia³ tekstu na s³owa
  words <- unlist(strsplit(text, "\\s+"))
  # Usuniêcie pustych elementów
  words <- words[words != ""]
  return(words)
  
}


# Stworzenie funkcji do obliczania czêstoœci wystêpowania s³ów ----
word_frequency <- function(words) {
  freq <- table(words)
  freq_df <- data.frame(word = names(freq), freq = as.numeric(freq))
  freq_df <- freq_df[order(-freq_df$freq), ]
  return(freq_df)
}

# Stworzenie funkcji do tworzenia chmury s³ów ----
plot_wordcloud <- function(freq_df, title, color_palette = "Dark2") {
  wordcloud(words = freq_df$word, freq = freq_df$freq, min.freq = 16,
            colors = brewer.pal(8, color_palette))
  title(title)
}


# Przyk³adowe u¿ycie funkcji ----


# Jeden plik txt ----


# Wczytanie i przetworzenie tekstu
# file_path <- "sciezka/do/pliku.txt"  <= Uzupe³nij nazwê pliku i ustaw Working Directory!
file_path <- "Biden2021.txt"
words <- process_text(file_path)


# Obliczenie czêstoœci wystêpowania s³ów
freq_df <- word_frequency(words)


# Tworzenie chmury s³ów
plot_wordcloud(freq_df, "Chmura s³ów", "Dark2")


# Wyœwietlenie 10 najczêœciej wystêpuj¹cych s³ów
print(head(freq_df, 10))



# Potrzeba dodatkowych stop s³ów do usuniêcia ----
custom_stopwords <- c("—", "–", "’s", "’re")


# Usuniêcie dodatkowych stop s³ów z przetworzonego tekstu 
# za pomoc¹ indeksowania logicznego
words <- words[!words %in% custom_stopwords]

# Obliczenie czêstoœci wystêpowania s³ów
freq_df <- word_frequency(words)

# Tworzenie chmury s³ów
plot_wordcloud(freq_df, "Chmura s³ów", "Dark2")

# Wyœwietlenie 10 najczêœciej wystêpuj¹cych s³ów
print(head(freq_df, 10))




# Dwa pliki txt równoczeœnie ----


# Lista plików do wczytania
file_paths <- c("Biden2021.txt", "Biden2024.txt")  # Uzupe³nij nazwy plików i ustaw Working Directory!


# Przetwarzanie ka¿dego pliku osobno
for (file_path in file_paths) {
  # Wczytanie i przetworzenie tekstu
  words <- process_text(file_path)
  
  # Obliczenie czêstoœci wystêpowania s³ów
  freq_df <- word_frequency(words)
  
  # Tworzenie chmury s³ów
  plot_wordcloud(freq_df, paste("Chmura s³ów -", file_path), "Dark2")
  
  # Wyœwietlenie 10 najczêœciej wystêpuj¹cych s³ów
  cat("Najczêœciej wystêpuj¹ce s³owa w pliku", file_path, ":\n")
  print(head(freq_df, 10))
  cat("\n")
}




# Potrzeba dodatkowych stop s³ów do usuniêcia ----
custom_stopwords <- c("—", "–", "’s", "’re")

# Przetwarzanie ka¿dego pliku osobno
for (file_path in file_paths) {
  # Wczytanie i przetworzenie tekstu
  words <- process_text(file_path)
  
  # Usuniêcie dodatkowych stop s³ów z przetworzonego tekstu
  # za pomoc¹ indeksowania logicznego
  words <- words[!words %in% custom_stopwords]
  
  # Obliczenie czêstoœci wystêpowania s³ów
  freq_df <- word_frequency(words)
  
  # Tworzenie chmury s³ów
  plot_wordcloud(freq_df, paste("Chmura s³ów -", file_path), "Dark2")
  
  # Wyœwietlenie 10 najczêœciej wystêpuj¹cych s³ów
  cat("Najczêœciej wystêpuj¹ce s³owa w pliku", file_path, ":\n")
  print(head(freq_df, 10))
  cat("\n")
}

