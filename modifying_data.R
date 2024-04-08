# Tourism
tourism <- read.csv("tourism_raw.csv", sep = ";")
colnames(tourism) <- c("date", "federal_state", "company", "arrivals", "nights")
tourism$date <- paste(substr(tourism$date, 1, 4), substr(tourism$date, 5, 7),sep = "-")
head(tourism)


# Weather
weather <- read.csv("weather_raw.csv", sep = ";")
head(weather)
weather[,1:4] <- NULL
weather[,5:8] <- NULL
weather[,6] <- NULL
weather[,7:20] <- NULL
colnames(weather) <- c("date", "avg_temp", "max_temp", "min_temp", "summerdays", "air_pressure")
weather$date <- paste(substr(weather$date, 1, 4), substr(weather$date, 5, 7),sep = "-")


# Selecting records randomly from tourism
# As the data set is too large (<75000 records), I am cutting it down using random sampling
set.seed(123)
sam <- sample(1:nrow(tourism), 5000, replace = FALSE)
smalldata <- tourism[sam,]
smalldata$rowid <- rownames(smalldata)
smalldata <- smalldata[order(as.numeric(smalldata$rowid)),]
smalldata$rowid = NULL


# Exporting our final data
write.csv(smalldata, "tourism.csv", row.names = FALSE)
install.packages("rjson")
library(rjson)
library(jsonlite)
x <- toJSON(weather)
write(x, "weather.json")










