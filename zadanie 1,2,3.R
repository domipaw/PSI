
# zadanie 1
text <- "And so even though we face the difficulties of today and tomorrow, I still have a dream."
text

install.packages("qdap")
library(qdap)

freq_terms(text)

frequent_terms <- freq_terms(text)
frequent_terms

plot(frequent_terms)
library(ggplot2)

ggplot(frequent_terms, aes(x = WORD, y = FREQ)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Słowo", y = "Częstość") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Wykres częstości słów")

ggplot(frequent_terms, aes(y = WORD, x = FREQ)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(x = "Słowo", y = "Częstość") +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  ggtitle("Wykres częstości słów")
ggplot(frequent_terms, aes(x = FREQ, y = reorder(WORD, FREQ))) +
  geom_bar(stat = "identity", fill = "skyblue", color = "darkblue", alpha = 0.8) +
  labs(x = "Częstość", y = "Słowo") +
  ggtitle("Wykres częstości słów") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10),
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.line = element_line(color = "black")) 

Top25Words
Top100Words
Top200Words

frequent_terms2 <- freq_terms(text, stopwords = Top25Words)
frequent_terms3 <- freq_terms(text, stopwords = Top100Words)
frequent_terms4 <- freq_terms(text, stopwords = Top200Words)

plot(frequent_terms4)

# zadanie 2

text <- "And so even though we face the difficulties of today and tomorrow, I still have a dream. It is a dream deeply rooted in the American dream."
text

frequent_terms <- freq_terms(text)
frequent_terms
frequent_terms <- freq_terms(text, stopwords = Top200Words)
plot(frequent_terms)

# zadanie 3


text_1<- readLines(file.choose('Downloads/Biden - First address to Congress_2021.txt')
text
text_2 <- readLines(file.choose('Downloads/Biden - State of the Union 2024.txt')
text
library(qdap)

frequent_terms <- freq_terms(text, stopwords = Top200Words)
frequent_terms
plot(frequent_terms)


install.packages("wordcloud")
library(wordcloud)

?wordcloud
?brewer.pal
brewer.pal.info

wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(8,"Dark2"))
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))

text_1 <- readLines((file.choose('Downloads/Biden - First address to Congress_2021.txt')
text_2 <- readLines((file.choose('Downloads/Biden - State of the Union 2024.txt')

frequent_terms_1 <- freq_terms(text_1, stopwords = Top200Words)
frequent_terms_1
plot(frequent_terms_1)

frequent_terms_2 <- freq_terms(text_2, stopwords = Top200Words)
frequent_terms_2
plot(frequent_terms_2)

wordcloud(frequent_terms_1$WORD, frequent_terms_1$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))
wordcloud(frequent_terms_1$WORD, frequent_terms_1$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))

wordcloud(frequent_terms_2$WORD, frequent_terms_2$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))
wordcloud(frequent_terms_2$WORD, frequent_terms_2$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))
