### What is multiple linear regression?
Multiple linear regression attempts to find a relationship between a dependent variable and more than one explanatory (or independent) variables.

For multiple linear regression, we have two or more explanatory variables. It is described as a general equation as shown below:

![n2](./assets/n2.jpg)

where y is the dependent variable, x<sub>1</sub>...x<sub>p</sub> are the explanatory variables with regression coefficients b<sub>1</sub>...b<sub>p</sub>, and b<sub>0</sub> is the intercept with the error term 𝜖.

### About the dataset
This is a simulated dataset made for teaching regression containing 10 independent variables named `Feat01`, `Feat02`..., `Feat10` and a dependent variable called `Target`. The dataset is stored in a CSV file called `data.csv`.

### The task
The task at hand is to predict the **Target** variable such that the values of predictions are as close to the actual values as possible. This will be done using a multiple linear regression model.

### A basic multiple linear regression model
As learnt in the previous scenario, we will train a multiple linear regression model using all available features. Copy the following code to the editor: 

<pre class="file" data-filename="lr.py" data-target="replace">
# Importing numpy and pandas
import numpy as np
import pandas as pd
# Reading the csv file using pandas 
data = pd.read_csv("data/data.csv")

# Extracting dependent and independent variables
X = data.drop(["Target"],axis=1)
y = data["Target"]

# Importing splitting method from Scikit-learn
from sklearn.model_selection import train_test_split
# Splitting
X_train, X_test, y_train, y_test = train_test_split(X, y,
                                                    test_size=0.3,
                                                    random_state=100,
                                                    shuffle=True)

# Fitting a linear model
from sklearn.linear_model import LinearRegression
model = LinearRegression()
# Training our model
model.fit(X_train,y_train)

# Taking predictions for the test set
y_pred = model.predict(X_test)

# Importing metrics from Scikit-learn
from sklearn.metrics import r2_score, mean_squared_error
# Calculating metrics
print("The R-squared score is {:.4f}".format(r2_score(y_test,y_pred)))
print("The Root Mean Squared error is {:.4f}".format(np.sqrt(mean_squared_error(y_test,y_pred))))
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

The above code loads the data, prepares it, trains a model with all available features, takes predictions, and finally evaluates the model.

Although in some cases, training a model with all available columns (features) in the dataset can lead to the best results, this approach is not intuitive and can lead to complications in the future. The model may not be able to capture all the information required and in the case of very large datasets can lead to very long training times even when all the available features are not important. To avoid these hurdles, methods like cross-validation and feature selection are used.