## Research Requirement
I am interested in the effect that *smoking* and 6 other variables (*age*, *sex*, *BMI*, *Children*, *Smoker*, and *region*) have on *expenses*. 

To achieve this, I will create a simple **linear regression model** and a **multivariate regression model**. These are needed to establish if there exists a linear relationship between the dependent variable and the independent variables.

I will also run a **t-test** based on the dataset to confirm if the true mean of expense is $10,000 or not.

## Analysis
### Histogram
![image](https://user-images.githubusercontent.com/121362860/225097756-e10bbad0-7363-4864-90bd-1ddfd32641e9.png)

* The histogram shows that the data is positively skewed i.e., skewed to the right. Hence, the distribution is not normal.
- Furthermore, there is more dataset concentrated toward the left-hand side of the mean.

Although a t-test and linear regression analysis assume the normality of a dataset, I will go on with the analyses.

### T Test
In order to test if the true population mean of expenses  = 10,000 or not, a one-sample two-tailed t-test will be conducted since the population standard deviation is unknown and we are checking for equality. T-test assumes the normality of the dataset, however, as earlier stated, we will go on with the test even though the distribution is skewed.

**Hypothesis Statement**
* Null Hypothesis, H0: Average expenses, µ = 10,000
+ Alternative Hypothesis, H1: Average expenses, µ ≠ 10,000 

**Significance level,** α = 0.05

**Test and Output**:

The test was conducted in R studio with the population mean (10,000), through which the following parameters were calculated
+ The degree of freedom(df) = 1337 (i.e., n-1)
- The p-value = 2.2 e -16. *This is the risk I am willing to take based on this analysis and it is way smaller than the significance level of 0.05*
* Sample mean = 13270.42 (which is not equal to 10,000)
+ 95% confidence interval = (12620.95 - 13919.89). *This implies that with 95% confidence, the interval between 12620.95 and 13919.89 contains the true mean*

**Conclusion**: With respect to the above, with 95% confidence, we will reject the null hypothesis which states that the average expenses  = 10,000, at the 0.05 significance level. 
Furthermore, there is enough evidence to show that the mean of expenses is not 10,000, hence, we will fail to reject the alternative hypothesis.

### Simple Linear Regression
**Hypothesis Statement**

Null hypothesis, H0:  β1= 0 There is no linear relationship between smoker and expenses. Consequently, the coefficient is not statistically significant.
Alternative hypothesis, H1: β1 ≠ 0. There exists a linear relationship between smoker and expenses. Hence, the coefficient is statistically significant.

**The Regression Model**

![image](https://user-images.githubusercontent.com/121362860/225100275-f23b2713-e014-49e8-8b33-b2b0c6d7517c.png)

y: expenses
x: smoker

![image](https://user-images.githubusercontent.com/121362860/225102726-a828911e-a92a-4b53-a8bd-fb3482d3f1fb.png)

**Model Interpretation and Evaluation**
* Smoker is a categorical variable: yes, no.
+ For every unit increase in smoker, there is a corresponding 23616 dollar increase in expenses. 
- According to the R2, the model (or the predictor, smoker) can explain the variability in only 62% of the y variable, expenses.
* The correlation coefficient = 0.79, which indicates a slightly strong positive relationship between *smoker* and *expenses*. I obtained this by converting *smoker* to dummy variables
+ The P-value (for the t-test and f-test)= 2.2e-16, which is lesser than the significance level of 0.05.
- With 95% confidence, we can reject the null hypothesis which states that the coefficient of the predictor, *smoker*, is not statistically significant. Furthermore,there us strong evidence to show that there is a relationship between *smoker* and *expenses*, and the results obtained are also in support of the alternative hypothesis.

### Multiple Linear Regression
**Hypothesis Statement**

H0: β1= β2 = β3 = β4 = β5 = β6 = 0. There is no correlation between the independent variables and expenses. Consequently, the coefficients are not statistically significant.
H1: βi ≠ 0 where i = 1,2,3..,n. At least one of the independent variables influences expenses. Hence, the coefficient of one of the independent variables is statistically significant.

**Multiple Linear Regression Model**

![image](https://user-images.githubusercontent.com/121362860/225101369-8c955821-dd0e-4183-9187-2493138d5046.png)

![image](https://user-images.githubusercontent.com/121362860/225101407-b2827ff1-7042-41f1-a0f2-499838fd9c02.png)

![image](https://user-images.githubusercontent.com/121362860/225101449-fd5c1200-0f3d-4df6-ae40-f901fe65c774.png)

* According to the adjusted R2, the model can explain the variability in 75% of the y variable, expenses. 
+ The p-value of the model is 2.2e-16 is less than 0.05. It seems like a good model, but we will still consider the independent variables.
- Weight: smoker = yes, has the highest positive weight on the dependent variable expenses.
* P-values
  + *Age*, *bmi*, *children*, and *smoker* (yes) are significant at 95% confidence interval (i.e., α = 0.05)
  * *Region* (southeast) and *region* (southwest) are significant at 90% confidence interval (i.e., α = 0.01)
  - *Sex* and *region* (northwest) are insignificant as they are greater than 0.05
* With 95% confidence, we will reject the null hypothesis which states that none of the independent variables have a correlation with expenses. Furthermore, the coefficients are statistically significant. 
+ Also, at the significance level of 0.05, it is best to use *Age*, *bmi*, *children*, and *smoker* (yes) to predict *expenses*. Whereas, at α =0.01, *Region* (southeast) and *region* (southwest) are the best variables to work with. 

### Conclusion
* Both models have the same p-value.
+ Overall, the models can be used to accurately predict expenses since the null hypothesis has been rejected. However, the multiple linear regression model is a better model for predicting expenses because there are more variables that can be relied on at a 5% or 10% significance level. Also, only the variables with significance should be used for the model.
- Finally, according to the adjusted R2, the multiple linear regression model (75%) can explain a higher percentage of variability in expenses than the simple linear model(62%).






















