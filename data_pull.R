#install.packages("rjson")
library("rjson")
file <- "https://www.reddit.com/r/ApplyingToCollege/top.json"
#data <- fromJSON(paste(readLines(file), collapse=""))
data <- fromJSON(file=file)
num_posts <- length(data$data$children)
txt <- c()
ttl <- c()

for (i in 1:num_posts){
  text <- data$data$children[[i]]$data$selftext
  title <- data$data$children[[i]]$data$title
  txt <- append(txt, text)
  ttl <- append(ttl, title)
}

#or

file <- "https://www.reddit.com/r/ApplyingToCollege/hot/.json?limit=100" #can change limit to get more
data <- fromJSON(file=file)
num_posts <- length(data$data$children)
txt <- c()

for (i in 1:num_posts){
  text <- data$data$children[[i]]$data$selftext
  txt <- append(txt, text)
}

# for reading from PDF: boring, old-school, slow
# install.packages("pdftools")
library(pdftools)
setwd("/Users/hk/Desktop")

files <- list.files(pattern = "pdf$")
opinions <- lapply(files, pdf_text)
opinion_str <- opinions[[1]]

library(tm)
corp <- Corpus(URISource(files),readerControl = list(reader = readPDF))
opinions.tdm <- TermDocumentMatrix(corp, 
                                   control = 
                                     list(removePunctuation = FALSE,
                                          stopwords = FALSE,
                                          tolower = FALSE,
                                          stemming = FALSE,
                                          removeNumbers = TRUE,
                                          bounds = list(global = c(1, Inf))))
inspect(opinions.tdm[1:10,]) 
findFreqTerms(opinions.tdm, lowfreq = 100, highfreq = Inf)


# for reading from iMessage Archives: broken
days_in_month <- c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
year <- "2019"
month <- "01"
month_ind <- 1
day <- "01"

data <- readChar(file.choose())

date <- paste(year, month, day, sep="-")
while (date != "2019-11-10"){
  
}