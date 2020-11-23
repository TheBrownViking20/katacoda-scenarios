### What is polynomial regression?
Polynomial regression is used to fit nonlinear data using linear models. This enables inclusion of nonlinear trends which are not captured by a linear approach. This is done by transforming existing data into its higher order terms. Eg., Some new features will be 2nd or 3rd powers of old features.

### Feature Engineering
Feature engineering is the process of creating new features from raw using domain knowledge via data mining techniques. These features can improve the performance of machine learning algorithms. Creating polynomial features for our task so we have more features to train our models on is an example of feature engineering.

### About the dataset
This is a simulated dataset made for teaching regression containing 10 independent variables named `Feat01`, `Feat02`..., `Feat10` and a dependent variable called `Target`. The dataset is stored in a CSV file called `data.csv`.

### The task
The task at hand is to predict the **Target** variable such that the values of predictions are as close to the actual values as possible. This will be done using a multiple linear regression model with polynomial features.

### A basic multiple linear regression model
As learnt in the previous scenarios, first we will train a multiple linear regression model using all available features. Copy the following code to the editor: 

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

Including polynomial features in our model can increase the efficiency of our model as now we have more information about our data. Now, our linear model will be able to utilise non-linear trends in our data to provide better results.