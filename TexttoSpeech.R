library(tidyverse)
library(tokenizers)
library(rvest)
library(tm)

page<-read_html ("https://knowindia.gov.in/republic-day-celebration/president-speech.php")
page %>% html_nodes("*") %>% html_attr("class") %>% unique()
results <- page %>% html_nodes("p") %>% html_text() %>%  str_trim()
results
abcd <- results[1:35]
efgh <- paste(abcd[1], abcd[2], abcd[3], abcd[4], abcd[5], abcd[6],abcd[7], abcd[8], abcd[9], abcd[10], abcd[11], abcd[12],
              abcd[13], abcd[14], abcd[15], abcd[16], abcd[17], abcd[18], abcd[19], abcd[20], abcd[21], abcd[22], abcd[23], abcd[24],
              abcd[25], abcd[26], abcd[27], abcd[28], abcd[29], abcd[30], abcd[31], abcd[32], abcd[33], abcd[34], abcd[35], abcd[36])
library(tm)

hijk<-tolower(efgh)
stopwords <- c("a", "an", "the", "i", "you", "we", "he", "she", "it", "its", "have", "has", "had", "was", "were", "for", "with", 
               "of", "if", "to", "will","shall", "would", "should", "could", "be", "been", "did", "my", "your", "na", "and", 
               "our", "in", "is", "as", "this","that", "on", "are", "am", "at")

hijk<- removeWords(hijk,stopwords)
hijk<-removePunctuation(hijk)
hijk<-removeNumbers(hijk)
hijk<-stripWhitespace(hijk)
words <- tokenize_words(hijk)
length(words)
tab <- table(words[[1]])
tab <- data_frame(word = names(tab), count = as.numeric(tab))
tab
arrange(tab, desc(count))

View(tab)