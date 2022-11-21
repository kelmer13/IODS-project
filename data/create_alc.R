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

```{r}
# Join the two data sets using all other variables than "failures", "paid", "absences", "G1", "G2", "G3" as (student) identifiers. 
# Keep only the students present in both data sets.

# access the dplyr package
library(dplyr)

free_cols <- c("failures", "paid", "absences", "G1", "G2", "G3")

join_cols <- setdiff(colnames(studentpor), free_cols)

# join the two data sets by the selected identifiers
math_por <- inner_join(math, por, by = join_cols)

# look at the column names of the joined data set
colnames(math_por)

# glimpse at the joined data set
glimpse(math_por)


```


