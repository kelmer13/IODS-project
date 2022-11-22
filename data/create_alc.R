# Keegan Elmer, 21 November 2022
# Data source: 
#   UCI Machine Learning Repository
#   Student Performance Data set 
#   Link: https://archive.ics.uci.edu/ml/datasets/Student+Performance

# Data Wrangling, step 3
```{r}
# "Read both student-mat.csv and student-por.csv into R (from the data folder)"
studentmat <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/student-mat.csv", sep=";", header=TRUE)
studentpor <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/student-por.csv", sep=";", header=TRUE)

# explore the structure and dimensions of the data
str(studentmat)
dim(studentmat)

str(studentpor)
dim(studentpor)
```

# Data Wrangling, step 5
```{r}
#Get rid of the duplicate records in the joined data set. 

newalc <- select(joined, all_of(join_cols))
for(col_name in free_cols) {
  two_cols <- select(joined, starts_with(col_name))
  first_col <- select(two_cols, 1)[[1]]
  if(is.numeric(first_col)) {
    newalc[col_name] <- round(rowMeans(two_cols))
  } else {
    newalc[col_name] <- first_col
  }
}

```

# Data Wrangling, step 6

```{r}
# Take the average of the answers related to weekday and weekend alcohol consumption to create a new column 'alc_use' to the joined data. 

newalc <- mutate(newalc, alc_use = (Dalc + Walc) / 2)

# Then use 'alc_use' to create a new logical column 'high_use' which is TRUE for students for which 'alc_use' is greater than 2 (and FALSE otherwise)

newalc <- mutate(newalc, high_use = alc_use > 2)

```

# Data Wrangling, step 7


```{r}
# Glimpse at the joined and modified data to make sure everything is in order. 

glimpse(newalc) 

# Results: newalc has 370 rows and 37 columns.

# Save the joined and modified data set to the ‘data’ folder, using for example write_csv() function (readr package, part of tidyverse).

write_csv(x = newalc, "data/newalc.csv")

```


