#  1.QUESTION ----

#1. Type the code below within R to generate a vector called vec1
#vec1 <- c(0, 2, 3, 0, 2, 11, 0, 7, NA)
vec1<- c(0, 2, 3, 0, 2, 11, 0, 7, NA)
vec1
#a) Remove the NA value, either by indexing or using the relevant function.
vec1<-vec1[!is.na(vec1)]
vec1
#b) Make a logical vector (e.g., either TRUE and FALSE) indicating the elements
#equal to zero as TRUE, and the remaining elements as FALSE.
vec1
vec1 %in% '0'
#c) Use the logical vector you have created to pick out the non-zero values and store
#them in a vector called no_zero.

no_zero <- vec1[vec1 != 0]
no_zero
#d) Check how many non-zero values you have in vec1 by taking the length of the
#vector no_zero (using function length())"
length(no_zero)


# 2.QUESTION ----

#2. In this exercise you will take data from a table and store the information in a data frame,
#that you then will export to a plain-text (.csv) file which is easy to work with in R,
#and any other statistical package.

        
#a) Construct a data frame (manually in R) from the table given below, including the
#three variables which you name in R (remember that a vector in R is a column):
#- W (average wage/h, given by the numbers in the table)
#- YEAR (including the years for each observation, given in the table)
#- GENDER (including characters indicating "Female" or "Male" (hint: rep() is useful).
#The number of rows should be as many as the number of values
#in the table, e.g., the number of rows in your data frame should be 18!
# Please note that the variable GENDER is based on the table below, but 
#the character values "Female" and "Male" need be given in R.


W <- c(120,109,122,112,124,115,130,121,136,128,140,132,143,135,150,140,155,148)
Y<- rep(2003:2011, c(2,2,2,2,2,2,2,2,2))
G<- c("Men", "women")
W
Y
G
df <- data.frame(W,Y,G)
df

#b) Export the data frame as a comma separated (.csv) file.
#It is not necessary to supply this .csv file to me as a teacher for grading,
#but the code should be correct and work!

getwd()
dir.create("LAB_Assignment_folder")
write.csv(df, "Assignment_folder/table.csv",row.names = FALSE)
data_csv <- read.csv("Assignment_folder/table.csv")
data_csv

# 3.QUESTION ----
#3. For this exercise you need to download the data file "Freedman.csv" from Learn.
#a) Import the data to R as data.frame() named Freedman.

data.frame <- read.csv("G:/R programming lab-2/Assignment/Assignment-1/Freedman.csv")
data.frame

#b) Use summary() and str() on the imported data.
summary(data.frame)
str(data.frame)
data.frame[2:5] <- lapply(data.frame[2:5], as.numeric)
data.frame




#c) Sometimes variables that are numeric is read as character or integer,
#but it is possible to use as.numeric() on these variables to define them as
#numeric. All variables except for the variable City should be numeric, make
#sure they are. (Hint: Freedman$variable, and assign new variable)
summary(data.frame)
str(data.frame)



#d) Using this data set, give the mean values of each column of data (not City).
#Remember that NA values must be accounted for in function mean()
mean(data.frame[["population"]])
NROW(data.frame[["population"]])
A <- Mean_of_population <- sum(data.frame[["population"]], na.rm = TRUE)/108  # as NA values is accounted so it is added and divided by no of values
Mean_of_population
B <- mean(data.frame[["nonwhite"]])
B

mean(data.frame[["density"]])
NROW(data.frame[["density"]])
C <- Mean_of_density <- sum(data.frame[["density"]], na.rm = TRUE)/108 # as NA values is accounted so it is added and divided by no of values
Mean_of_density
C
D <- mean(data.frame[["crime"]])

print(paste("mean score of population:",A))
print(paste("mean score of nonwhite:", B))
print (paste("mean score of density:", C))
print (paste("mean score of crime:", D))

#e) Retrieve the rows which have a non-white population larger than 30%.
#(This is what the column nonwhite gives us as information, % non-white)


data<-data.frame$nonwhite
data
data[data > 30]

data.frame$data.frame <- data.frame$nonwhite >= 30.0
subset(data.frame, nonwhite> 30.0,)

# 4.QUESTION ----

#4. For this exercise we will use the Prestige data frame in the package
#car.
#a) Install the package, if you haven't done it already, and load the data frame.
#Read the help file for the data to learn about the variables.
#(?Prestige)

install.packages("car")
library(car)
data(Prestige)
Prestige
?Prestige




#b) Select a subset of the data for occupations with more than 50% women
#and store this data.frame as an object sub_prestige_women.
sub_prestige_women<- subset(Prestige, women> 50.0,)
sub_prestige_women

str(sub_prestige_women)
summary(sub_prestige_women)

#c) Use this subset and compute the average prestige score.
  
mean(sub_prestige_women$income, na.rm = TRUE)  
mean(sub_prestige_women$women, na.rm = TRUE)  
mean(sub_prestige_women$prestige, na.rm = TRUE)  
mean(sub_prestige_women$census, na.rm = TRUE)  


#d) Now compute the average prestige score for occupations with less than
#50% women.
sub_prestige<- subset(Prestige, women < 50.0,)
sub_prestige





#e) For this final question below, use the complete Prestige data again
#(e.g., do not use sub_prestige_women).
#Make a for-loop to compute the average (mean) prestige score for
#the three different types of occupations. Automatically store the
#three means in a vector.
#(Hint: if you want a vector of the professions, there is a function unique() 


Prestige
unique(Prestige['type'])

library(purrr)
AVG_MEAN_SCORE <- split(Prestige, Prestige$type)
AVG_MEAN_SCORE 

AVG_MEAN_SCORE$wc     
mean(AVG_MEAN_SCORE$wc$prestige)
mean(AVG_MEAN_SCORE$prof$prestige)
mean(AVG_MEAN_SCORE$bc$prestige)


mean(AVG_MEAN_SCORE$wc$prestige)
mean(AVG_MEAN_SCORE$prof$prestige)
mean(AVG_MEAN_SCORE$bc$prestige)

for (p  in AVG_MEAN_SCORE) 
{ 
  print(p)
}

for (p  in AVG_MEAN_SCORE) 
{ 
  a= mean(AVG_MEAN_SCORE$wc$prestige)
  b = mean(AVG_MEAN_SCORE$prof$prestige)
  c = mean(AVG_MEAN_SCORE$bc$prestige)
}
print(paste("mean prestige score of wc:",a))
print(paste("mean prestige score of prof:", b))
print (paste("mean prestige score of bc:", c))



#Above for loop displays the mean score for the wc, prof, bc

