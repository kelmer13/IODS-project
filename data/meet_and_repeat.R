# Keegan Elmer, 13.12.2022, IODS Assignment 6

# Read in the data

#1. Load the data sets (BPRS and RATS) into R
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')
library(dplyr)

# Take a look at the data sets 
# Check their variable names
names(BPRS)
names(RATS)

# view the data contents... 
summary(BPRS)
summary(RATS)

# and structures
str(BPRS)
str(RATS)

# Brief summary of BPRS
## This is a longitudinal study of men undergoing two different types of psychological treatment
## The BPRS is a rating of their subject psychological feelings of anxiety, depression, and other conditions
## In the data, we need to be aware of one man's ratings who look extraordinarily high, and may be an outlier
## In addition, columns like "treatment" are integers, and should be treated as factors. 

# Brief summary of RATS
## RATS contains longitudinal data on groups of rats on particular diets, fed weekly over several weeks. 
## One problem with the data is that variables like "group" and "ID" are integers, and will have to be changed to factors

# 2. Convert the categorical variables of both data sets to factors.

# Convert relevant variables BPRS
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

# Convert relevant variables RATS
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# 3. Convert the data sets to long form

# Convert BPRS to long form, and add Week variable; from "BPRS" to "BPRSL"

BPRSL <-  pivot_longer(BPRS, cols = -c(treatment, subject),
                       names_to = "weeks", values_to = "bprs") %>% arrange(weeks) 

# Convert RATS to long form, and add Time variable; from "RATS" to "RATSL"

RATSL <- pivot_longer(RATS, cols = -c(ID, Group), 
                      names_to = "WD",
                      values_to = "Weight") %>% 
  mutate(Time = as.integer(substr(WD,3,4))) %>%
  arrange(Time)

# 4. SERIOUS LOOK at the data sets

# Check the variable names
names(BPRSL)
names(RATSL)

# View the data contents...
glimpse(BPRSL)
glimpse(RATSL)

# ...and structure
str(BPRSL)
str(RATSL)

# Brief summary of BPRSL, and *why* long is better
## The BPRSL form of the data has far fewer variables: treatment, subject, weeks and bprs. 
## This form is far more concise than its previous wide form. 
## Moreover, with the weeks "stacked" down the page of data, all in one column, it makes it far easier to reference
## In the previous wide form, we would have had to reference multiple week columns to find out information longitudinally.
## In short, the long form is better. 

# Brief summary of RATSL, and *why* long is better
## RATSL is significantly more cleaned up than the previous wide form. 
## Having factor variables helps us track each mouse's information down the long columns of information about weight and time



