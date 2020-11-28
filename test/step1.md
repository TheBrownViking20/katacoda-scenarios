### What is linear regression?
Linear regression attempts to find a relationship between a dependent variable and one or more explanatory (or independent) variables. In case of simple linear regression where there is only one explanatory variable, linear regression is described as a general equation as shown below:

![n1](./assets/n1.jpg)

where y is the dependent variable, x is the explanatory variable with coefficient b1, and b0 is the intercept with the error term 𝜖.

For multiple linear regression, we have two or more explanatory variables. It is described as a general equation as shown below:

![n2](./assets/n2.jpg)

where y is the dependent variable, x<sub>1</sub>...x<sub>p</sub> are the explanatory variables with regression coefficients b<sub>1</sub>...b<sub>p</sub>, and b<sub>0</sub> is the intercept with the error term 𝜖.

### About the dataset
This is a simulated dataset made for teaching regression containing 10 independent variables named `Feat01`, `Feat02`..., `Feat10` and a dependent variable called `Target`. The dataset is stored in a CSV file called `data.csv`.

### The task
The task at hand is to predict the `Target` variable such that the values of predictions are as close to the actual values as possible. This will be done using a baseline linear regression model made from scratch using NumPy.

### A basic multiple linear regression model
As learnt in the previous scenario, first we will train a linear regression model using all available features. Copy the following code to the editor: 

<pre class="file" data-filename="lr.py" data-target="replace">
# Importing numpy and pandas
import numpy as np
import pandas as pd
# Reading the csv file using pandas 
data = pd.read_csv("data.csv")

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
print("_____________________")
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

The above code loads the data, prepares it, trains a model with all available features, takes predictions, and finally evaluates the model.

Now, we start building a linear regression model from scratch using numpy. This will teach you the inner workings of a linear regression model.