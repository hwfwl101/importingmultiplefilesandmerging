#set specdata as working directory
setwd("C:/Users/hwfwl/Desktop/ALLTHATIS R/SPECDATA/specd/specdata")
#confirm
getwd()
#install packages and call from library
install.packages("dplyr")
library(readr)
library(plyr)
library(dplyr)
#define the 100.csv
fhund <- read.csv("100.csv", header=TRUE, sep= ",", fill=TRUE, strip.white= TRUE, col.names= c("Date", "sulfate", "nitrate", "ID"), colClasses= c("character", rep("numeric", 2), "integer"))
#confirm class
class(fhund)
#from the dplyr package, define fhund to extend row numbers
tbl_df(fhund)
#change the Date column from character class to date class
fhund$Date <- as.Date(fhund$Date, format= "%Y-%m-%d")
#redefine fhund as the dplyr type
fhund<- tbl_df(fhund)
#define the 200.csv
fhund2 <- read.csv("200.csv", header=TRUE, sep= ",", fill=TRUE, strip.white= TRUE, col.names= c("Date", "sulfate", "nitrate", "ID"), colClasses= c("character", rep("numeric", 2), "integer"))
#confirm class
class(fhund2)
#from the dplyr package, define fhund2 to extend row numbers
tbl_df(fhund2)
#change the Date column from character class to date class
fhund2$Date <- as.Date(fhund2$Date, format= "%Y-%m-%d")
#redefine fhund2 as the dplyr type
fhund2<- tbl_df(fhund2)
#merge both fhund and fhund2
fhundboth <- merge(fhund, fhund2, by="Date")
#redefine fhundboth as the dplyr type
fhundboth <- tbl_df(fhundboth)
#set name for directory
directory <- getwd()
#set name for list of directory files
dirlist <- list.files(directory, full.names = TRUE)
#to confirm that dirlist belongs to the character class
class(dirlist)
#convert dirlist into list class
dirlist <- lapply(dirlist, read.csv, header=TRUE)
#confirm class
class(dirlist)
#use the dplyr package to bind rows
dirlist <- bind_rows(dirlist)
#redefine dirlist as dplyr type
dirlist <- tbl_df(dirlist)
#change the Date column to the Date class
dirlist$Date <- as.Date(dirlist$Date, format= "%Y-%m-%d")
#since dirlist have been modified, a new file list is required
allfiles <- list.files(directory)