#load libraries
library (ggplot2)
library(lattice)
library(psych)
library(gmodels)
library(fastDummies)

#access the data
View(MultiRegDataset)

#Summary statistics
describe(MultiRegDataset)

#a histogram showing the distribution of expenses
hist_expenses <- ggplot(MultiRegDataset, aes(x= expenses)) + labs (title = "Histogram showing the Distribution of Expenses") + theme (plot.title = element_text(hjust = 0.5)) + xlab('Expenses') +ylab('Density')
hist_expenses <- hist_expenses +geom_histogram (colour="red",fill = "Blue", bins =30,aes(y=..density..))
hist_expenses <- hist_expenses + stat_function (fun = dnorm, color ="red", args = list(mean = mean(MultiRegDataset$expenses), sd =sd(MultiRegDataset$expenses)))
hist_expenses

#The T-test
mu = 10000
t.test(MultiRegDataset$expenses, mu=10000)

#The simple linear regression model
#a scatter plot of smoker vs expenses
ggplot (data = MultiRegDataset, aes (x = smoker, y =expenses)) + geom_point(color = "blue") + geom_smooth(color = "red") + labs (title = "Scatter plot of smoker vs expenses")+ theme(plot.title = element_text(hjust=0.5))
# Simple of simple Linear Model
model<-lm(expenses~smoker, data=MultiRegDataset)
LinearModel<-model
#Summary of the Key Statistics of the Linear Model
summary(LinearModel)

# Multiple linear regression model
model_m <- lm (expenses ~ ., data = MultiRegDataset)
MultivariateModel <- model_m
#Summary of the Key Statistics of the Multiple Linear Model
summary(MultivariateModel)

#To calculate correlation
#create table with a dummies column for smoker
new_table <- dummy_cols(MultiRegDataset, select_columns ="smoker")
#Correlation between smoker and expenses
cor(new_table$smoker_yes, new_table$expenses)