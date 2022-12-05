# Keegan Elmer
# IODS Assignment 5
# Original data source: 
# https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human1.txt

# Load the ‘human’ data into R

## This data we will be using comes from the United Nations Development Program, and its "Human Development Index" (HDI). The HDI is a a combination of metrics of human wellbeing.
## Specifically, the HDI uses a combination of metrics of life expectancy, education, and income, for essentially every country in the world.

human <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human1.txt", 
                    sep =",", header = T)

# Explore the structure and the dimensions 

names(human)
str(human)
summary(human)

## Overall there are 195 observations, and 19 variables. 
## Norway, Australia and Switzerland are listed as the top three countries with the highest HDI.
## We can see from the summary of the data that a variable like "Edu.Exp" (expected years of education), shows that the lowest country has 4.1 years of expected education, while the highest is 20.2

# 1. Mutate the data

library(stringr)
str(human$GNI)
human$GNI <- str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric()

# 2. Exclude unneeded variables

library(dplyr)
keep <- c("Country", "Edu2.FM", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- dplyr::select(human, one_of(keep))

# 3. Remove all rows with missing values 

human <- filter(human, complete.cases(human))

# 4. Remove the observations which relate to regions instead of countries

last <- nrow(human) - 7
human <- human[1:last, ]

# 5.1 Define the row names of the data by the country names

rownames(human) <- human$Country

# 5.2 ...and remove the country name column from the data

human <- select(human, -Country)

# 5.3 The data should now have 155 observations and 8 variables 

dim(human)

## check and check!

# 5.4 Save the human data in your data folder including the row names. You can overwrite your old ‘human’ data. 

write.table(human, "data/human", append = FALSE, sep = ",", dec = ".", row.names = TRUE, col.names = TRUE)

