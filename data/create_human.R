# Keegan Elmer, 11.29.2022, IODS Assignment 4

# Read in the data

# 1. Create a new R script called create_human.R

# 2. Read in the “Human development” and “Gender inequality” data sets

```{r}

library(tidyverse)
hd <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human_development.csv")
gii <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/gender_inequality.csv", na = "..")

```

# 3. Explore the datasets: see the structure and dimensions of the data. Create summaries of the variables. 

# 3.1.1 hd structure and dimensions

```{r}

str(hd)
dim(hd)

```

## "hd" is data set with 8 variables and 195 observations

# 3.1.2 hd summary

```{r}

summary(hd)

```

# 3.2.1 gii

```{r}

str(gii)
dim(gii)

```

## "gii" is a data set with 195 observations and 10 variables 

# 3.2.2 gii summary

```{r}

summary(gii)

```

# 4. rename the variables 

```{r}

gii %>% rename(Edu2.M = `Population with Secondary Education (Male)`)
...


```

# 5. Mutate the “Gender inequality”

```{r}

mutate(gii, edu2F/edu2M)
mutate(gii, labF/labM)

```

# 6. Join together the two datasets


```{r}

human <- inner_join(gii, hd, by = "Country")

```
# NOTE: I encountered errors when I was renaming the columns. This then caused problems in the "mutate" section, and so I could not add additional, accurate rows. The join function worked well, but it is missing the two additional mutated columns.


# 6.1 Save the data


```{r}

write_csv(x = human, "data/human")

```

# NOTE: Not sure why this didn't work. The file is not recognized as a standard csv