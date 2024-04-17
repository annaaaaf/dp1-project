# Detecting file encoding
library(stringi)
lines_raw <- stri_read_raw("hunde-wien.csv")
stri_enc_detect(lines_raw)


dogs <- read.csv("hunde-wien.csv", sep = ";", fileEncoding = "ISO-8859-1")
table(dogs$SUB_DISTRICT_CODE) # nothing in here
dogs$SUB_DISTRICT_CODE <- NULL
dogs$Dog.Breed <- gsub('ä', 'ae', dogs$Dog.Breed)
dogs$Dog.Breed <- gsub('Ä', 'Ae', dogs$Dog.Breed)
dogs$Dog.Breed <- gsub('ö', 'oe', dogs$Dog.Breed)
dogs$Dog.Breed <- gsub('Ö', 'Oe', dogs$Dog.Breed)
dogs$Dog.Breed <- gsub('ß', 'ss', dogs$Dog.Breed)
dogs$Dog.Breed <- gsub('ü', 'ue', dogs$Dog.Breed)
dogs$Dog.Breed <- gsub('Ü', 'ue', dogs$Dog.Breed)

idx <- sample(nrow(dogs), 5000)
order(idx)
sample <- dogs[idx, ]
sample$rowid <- rownames(sample)
sample <- sample[order(as.numeric(sample$rowid)),]
sample$rowid = NULL

write.csv(sample, "dogs.csv", fileEncoding = "UTF8", row.names = FALSE)
