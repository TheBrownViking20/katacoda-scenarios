# <p align="center">Linear Regression with Python</p>

## Multiple Linear Regression using Python

In this scenario, you will learn how to create linear regression algorithms from scratch using Numpy, a library for numeric computing in Python. Building linear regression algorithms using just mathematical formulas and linear algebra provides in-depth knowledge about the algorithm's inner working and helps in building intuition in future use cases. We will be using other python libraries for this tutorial. We will use pandas for data loading and data manipulation, matplotlib for data visualization and Scikit-learn for data preprocessing and modeling.

### What is linear regression?
Linear Regression attempts to find a relationship between a dependent variable and one or more explantory (or independent) variables. Linear regression can be used for various tasks.For example, a given dataset has data about locations of houses in a state/province, their prices, their architecture, their neighborhood, etc. This dataset can be used to estimate the prices for houses (which may not have been listed yet) in that particular state. This is useful for house owners, potential buyers, and real estate agencies.

Other uses of regression are:
* Stock price prediction
* Weather forecasting
* Predictive analysis from survey data
* Market research studies
* Future sales prediction and much more

### What is cross-validation?
How can we be sure that a linear regression model gives at least similar performance on other data samples with same parameters using different training samples? As a data scientist, we must ensure that our model gives similar performance for any data sample, seen or unseen before. Therefore, to estimate the skill of our machine learning models, we use cross validation. Cross-validation is a resampling procedure where we measure the performance of our model by training and testing it on different data samples from the available data. A good model's performance will remain similar on matter what data sample is used.

### What is feature selection?
It should be noted that not all available features will be useful for your model or be able to explain significant variability. Some features may also negatively affect the model performance. To tackle this, feature selection methods are used. Using these methods, we can find out the most relevant features and discard the useless features. As a result, we get a lightweight model with similar or better performance.