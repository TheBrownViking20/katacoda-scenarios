### Lasso Regression
Lasso regression or **L1 regularization** not only brings values of coefficients near zero but to exact zero in case of weak regressors. So, it not only shrinks coefficient estimates towards zero but also helps in feature selection.

Penalty is described by 𝜆 parameter. More the value of 𝜆, lesser the flexibility. For low values of 𝜆, the coefficients are very similar to that of a multiple linear regression model. As 𝜆 increases, the differences between the results of Lasso model and linear regression model increase.

Following is a demonstration where we use increasing values of 𝜆 iteratively to show the effect of Lasso Regression.

First, we will train a multiple linear regression model to acquire its coefficients. Copy the following code to the editor:

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

# The coefficients for each columns as a table
model_coefs = pd.DataFrame({'Feature/Column':list(X_train.columns),"Coef_linear":model.coef_})
print(model_coefs)
print("_____________________")
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

Now, let's train Lasso regression models for increasing values of 𝜆 parameter. To peform L1 regularization, we will use a `Lasso` class object. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
# Lasso() for L1 regularization
from sklearn.linear_model import Lasso

alpha_values = [0.0001,0.001,0.01,0.1,1] # Different values for 𝜆 parameter
for i in alpha_values:
    # Fitting a lasso regression model
    lasso = Lasso(alpha=i) # Lasso regression with penalty i
    lasso.fit(X_train,y_train) 

    # Adding to the table of coefficients
    model_coefs["Coef_lasso_alpha{}".format(i)] = lasso.coef_
    
    # Getting predictions
    y_pred_new = lasso.predict(X_test)
    
    # Evaluation
    print("At alpha = {}".format(i))
    print("The R-squared score is {:.4f}".format(r2_score(y_test,y_pred_new)))
    print("The Root Mean Squared error is {:.4f}".format(np.sqrt(mean_squared_error(y_test,y_pred_new))))
    print("__________")
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

All these models score similar or less than the linear model but are less likely to overfit. Let's compare their coefficients with the linear model using the table of coefficients.