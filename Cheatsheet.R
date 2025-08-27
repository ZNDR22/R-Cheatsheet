#=====================================================CHEATSHEET======================================================

#A cheat sheet for R, Rstudio, and tidyverse.


#SYNTAX===============================================================================================================

%>% 
  #Indicates a pipe (is relatively equal to 'then' in other pro %>% gramming languages).
  
  == 
  #Is used to ask where a variable contains a value rather than stating a variable is equal to a value.
  #Example:
  dataframe %>% 
  filter(sex == "male")
#Will filter where in the data frame someone's sex is male.

\\
#Using double backslashes when pathing to a file can help mitigate an error.

%in%
  #Used to find values which are within a variable
  #Example:
  filter(variable %in% c("value", "value"))


#RSTUDIO KEYBOARD SHORTCUTS===========================================================================================

#ALT + SHIFT + K = Shows all keyboard shortcuts.
#CTRL + ENTER = Run only selected line(s).
#CTRL + ALT + B = Run code up to selected line.
#CTRL + ALT + R = Run all code.
#CTRL + SHIFT + M = %>% 


#PACKAGE MANAGEMENT===================================================================================================

data()
#Shows a list of data sets sorted by installed packages.

install.packages("package")
#Installs data package.

library(package)
#Calls a package for use.


#UTILIZING VARIABLES==================================================================================================

variable <- X
#Assigns the value to a variable.
#Example:
a <- 5 
#assigns the value of 5 to a.

variable <- c(X, Y)
#Assigns a concatenation (succession of values, or vector) to a variable.


#MATHEMATICS==========================================================================================================

X+Y-Z/(X*Y^Z)
#Preforms a mathematical calculation and outputs the result.

sum(X,Y)
#Presents the sum of the numeric variables contained.

abs(-X)
#Shows the absolute value of the contained numeric variable.

min(dataframe$variable)
#Shows the lowest numeric value contained in a variable.

max(dataframe$variable)
#Shows the greatest numeric value contained in a variable.

range(dataframe$variable)
#Shows the range between the lowest and greatest numeric value contained in a variable.

mean(dataframe$variable)
#Shows the mean of a numeric.

median(dataframe$variable)
#Shows the median contained in a data frame variable.

mode(dataframe$variable)
#Shows the mode(s) contained in a data frame variable.

IQR(dataframe$variable)
#Shows the interquartile range (the difference between the 75th and 25th percentiles of data).


#-----SUMMARIZING DATA-----

summary(dataframe$variable)
#Shows the min, median, mean, max, and IQR.

dataframe %>% 
  summarise(variable = operation(variable))
#Allows the creation of custom summary tables 
#NOTE: summarize and summarise both work for this command


#PRESENTING & CLEANING DATA===========================================================================================

dataframe$variable
#Presents the chosen variables from a data frame in the console.

dataframe[ ,Y]
#Presents selected subsets of a data frame by row # and column #, with blank spaces presenting all data in that axis.

dataframe <- data.frame(variable, variable)
#Creates a data frame for a new data set utilizing X and Y as listed variables.

dataframe$variable <- as.class(dataframe$variable)
#Changes the class of a variable.
#Example:
dataframe$variable <- as.factor(dataframe$variable)
#Changes variable to a factor class.

dataframe %>% 
  rename("newvariable" = "oldvariable")
#Renames the variables in a data frame.

dataframe %>% 
  arrange(variable)
#Arranges the data frame by the selected variable, defaulting to increasing numeric, and alphabetical.
arrange(-variable)
#Inverts the default numerical variable arrangement to decreasing instead of increasing.

levels(dataframe$variable)
#Shows the order of values in a variable.

distinct(dataframe)
#Removes duplicate values from being listed.
#NOTE: This command is equivalent to:
dataframe %>% 
  distinct()

if_else()
#Used to specify an action (if), and then specifies an alternative action (else)
#EXAMPLE:
mutate(tallness = if_else(height < 100, "short", "tall"))
#Creates a variable "tallness" then specifies "short" IF the height value is under 100, or ELSE it specifies "tall".


#-----PRESENTING DATA-----

View(dataframe)
#Shows a full data frame (spreadsheet).

str(dataframe)
#Shows the structure of a data frame.

head(dataframe)
#Shows first 6 value columns in the console.

glimpse(dataframe)
#Shows a quick overview of values in the console.

class(dataframe$variable)
#Outputs the class of a variable.

length(dataframe)
#Shows the amount of variables in a data frame.

length(dataframe$variable)
#Shows the amount of observations in a particular variable.

names(dataframe)
#Lists all names of the variables in a data frame.

unique(dataframe$variable)
#Lists unique values within a given variable.

table(dataframe$variable)
#Creates a table showing the amount times each value occurs within a variable.

#-----PLOTTING GRAPHS-----

plot(dataframe)
#Shows the values of a data frame as a scatter plot graph.




#-----REMOVING MISSING DATA-----

missing <- complete.cases(dataframe)
dataframe[missing, ]
#Presents all the rows of a data frame where there IS NO missing values.
missing <- !complete.cases(dataframe)
dataframe[missing, ]
#Presents all the rows of a data frame where there IS missing values.

dataframe %>% 
  drop_na(variable) %>%
  #Removes missing values from a variable.
  
  na.rm = TRUE
#Removes variables from a command where there is no value (listed na).
#EXAMPLE:
command(dataframe$variable, na.rm = TRUE)


#-----SELECT-----

dataframe %>% 
  select(variable, variable) %>% 
  #Selects what variables will be shown in the output.
  
  dataframe %>% 
  select(X:Y) %>% 
  #Selects what variables will be shown in the output by its numerical order in the data frame.
  
  dataframe %>%
  select(ends_with("text"))
select(starts_with("text"))
select(contains("text"))
#Selects variables which contain the given text.
#Example: 
select(ends_with("color")) 
#Could output the variables "hair_color", "eye_color", and "skin_color".

dataframe %>% 
  select(variable3, variable1, variable2, everything())
#Select can be used to change the order of variables in a data frame. everything() will output everything not stated.

dataframe %>% 
  mutate(variable1 = variable2/100) %>% 
  select(variable1, variable2)
#Select can still be used to show variables that have been "overwritten".


#-----FILTER-----

dataframe %>%
  filter(variable > X & variable == "value")
#Filters the data frame by the included parameters. (See == in the syntax section above)


#-----MUTATE-----

dataframe %>%
  mutate(newvariable = oldvariable)
#Creates a new variable, or "overwrites" and existing variable.
#Example: 
mutate(meters = centimeters/100)
#Converts the variable name "centimeters" to "meters" while also processing the numeric conversion.

dataframe %>%
  mutate(variable = as.class(variable))
#Changes the class of a variable.

mutate(variable = recode(variable, "value1" = "value2", "value3" = "value4"))
#Renames values within the given variable.


#-----PIVOT-----

dataframe <- dataframe %>% 
  pivot_wider(names_from = variable1, values_from = variable2)
#Creates new variables from the value column of variable1, then makes them contain the values from variable2's column.

dataframe <- dataframe %>% 
  pivot_longer(X:Y, names_to = "variable1", values_to = "variable2")
#Selects the X to Y rows, then takes all the selected variables and converts them to values under the variable1 column.
#Then takes all the values from the selected rows, and assigns them under the variable2 column.


#EXPORTING============================================================================================================

library(writexl)
write_xlsx(dataframe, 'C:\\path\\dataframe.xlsx')
#Exports a data frame as an excel file to the selected directory. (See \\ in the syntax section above)


#=====================================================================================================================