sample(1:20291,100, replace = FALSE, prob = NULL)

install.packages("bayess") 
library(bayess) 
set.seed(25) 
#Simulating GPA 
GPA<-round(truncnorm(20291,2.9, 2, 0, 4),digits=2) 
#Simulating student number 
number<-seq(1,20291) 
student_list<-data.frame(number, GPA) 
# Sample 100 rows without replacement 
sampled_Studlist <- student_list [sample(nrow(student_list), 
                                         size =100 , replace = FALSE), ] 
#Suppress data frame row numbers 
formals(print.data.frame)$row.names <- FALSE 
print(head(sampled_Studlist)) 
mean(sampled_Studlist$GPA)
mean(student_list$GPA)

## 9_30
install.packages("readxl")
library(readxl)
GettysburgData <- read_excel("~/Data_Analysis/GettysburgData .xlsx") 
head(GettysburgData)

sampled_Word <- sample(GettysburgData$Word, size = 20, replace = FALSE) 
print(sampled_Word)
set.seed(25) 
sampled_Wordlist <- GettysburgData [sample(nrow(GettysburgData), size =25 , replace = FALSE), ]
sampled_Wordlist

count<-table(sampled_Wordlist$ThreeOrLessLetters) 
count[2]/nrow(sampled_Wordlist)

count<-table(GettysburgData$ThreeOrLessLetters) 
count[2]/nrow(GettysburgData)

## 10_2
install.packages("bayess") 
library(bayess)
install.packages("dplyr")
library(dplyr)

set.seed(25) 
#Simulating GPA 
GPA<-round(truncnorm(20291,2.9, 2, 0, 4),digits=2) 
#Simulating student number 
number<-seq(1,20291) 
gender <- ifelse(rbinom(n = 20291, size = 1, prob = 0.5) == 1, "F", "M")
student_list<-data.frame(number, GPA, gender)
head(student_list)

filtered_Female <- filter(student_list, gender == "F") 
head(filtered_Female)
filtered_Male <- filter(student_list, gender == "M") 
head(filtered_Male)

#Female 
set.seed(25) 
sample_data_female <- sample_n(filtered_Female, size = 25)

#Male 
size = 25 
sample_data_male <- sample_n(filtered_Male, size = size) 
#Combining samples 
comb_sample <- rbind(sample_data_female, sample_data_male) 
mean(comb_sample$GPA)


set.seed(25) 
#Simulating GPA 
GPA<-round(truncnorm(20291,2.9, 2, 0, 4),digits=2) 
#Simulating student number 
number<-seq(1,20291) 
gender <- rbinom(n = 20291, size = 1, prob = 0.5)  
gender <- ifelse(gender==1, "F", "M") 
program_id <- sample(1:10,20291, replace=TRUE) 
student_list<-data.frame(number, GPA, gender, program_id) 
# Number of clusters to select 
set.seed(25) 
num_clusters <- 3 
# Randomly select clusters 
selected_clusters <- sample(unique(student_list$program_id), num_clusters) 
selected_clusters
