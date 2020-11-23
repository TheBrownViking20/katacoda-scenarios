### Creating polynomial features
We will start with a Polynomial Regression model with 2nd degree polynomial features. We will use Scikit-learn's `PolynomialFeatures` class object to create polynomial features. Copy the following code to the editor: 

<pre class="file" data-filename="lr.py" data-target="replace">
# Importing numpy and pandas
import numpy as np
import pandas as pd
# Reading the csv file using pandas 
data = pd.read_csv("data/data.csv")

# Extracting dependent and independent variables
X = data.drop(["Target"],axis=1)
y = data["Target"]

from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression

# Creating polynomial features
poly = PolynomialFeatures(2) # 2 means features of 2nd power
X_poly2 = poly.fit_transform(X)

print("The number of features has increased from {} to {} with the inclusion of 2nd degree polynomial features.".format(X.shape[1],X_poly2.shape[1]))
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}


Let's estimate the results of polynomial regression of 2nd degree using k-fold cross-validation. We will use R-squared error and RMSE as scoring metrics. Append the following code to the editor: 

<pre class="file" data-filename="lr.py" data-target="append">
from sklearn.model_selection import cross_val_score

print("Cross-validation based on all polynomial features:")

r2_cross_val = cross_val_score(LinearRegression(),X_poly2,y,cv=3,scoring="r2")
print("The 3-fold CV R^2 scores are {} \nwith a mean R^2 score of {:.4f}".format(r2_cross_val,np.mean(r2_cross_val)))

rmse_cross_val = cross_val_score(LinearRegression(),X_poly2,y,cv=3,scoring="neg_root_mean_squared_error")
print("The 3-fold CV RMSE scores are {} \nwith a mean RMSE of {:.4f}".format([-i for i in rmse_cross_val],-np.mean(rmse_cross_val)))
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

As seen in the output of the above code, the R^2 score has increased significantly. RMSE is now less than half of the original model. Hence, due to polynomial features, we have a much better model now. Let's take the top 25 features for a more lightweight model. We will use F-value based feature selection we learned in the previous scenarios for this.