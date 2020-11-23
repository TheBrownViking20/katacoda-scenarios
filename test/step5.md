#### Recursive Feature Elimination (RFE) Method
This method involves feature ranking with recursive feature elimination. The goal is to select features by recusrsively using smaller and smaller sets of features. First, the external estimator (LinearRegression() in our case) is trained on all features. The feature with least importance is pruned. This process repeats till we have the specified number of best features. Let's try this with the 5 best features.

We will use `RFE` class object provided by Scikit-learn to apply this method. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="replace">
# Importing numpy and pandas
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
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

from sklearn.feature_selection import RFE

selector = RFE(LinearRegression(), n_features_to_select=5, step=1, verbose=1)
selector = selector.fit(X,y)

# DataFrame of results
rfe_df = pd.DataFrame({"Feature/Column":list(X.columns),"Support":selector.support_,"Ranking":selector.ranking_})
print(rfe_df.sort_values("Ranking"))
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

As seen in the output of the above code, features where *Support* is True and *Ranking* is 1 have been selected. Other features have been ranked according to their importance. Let's estimate the model performance with the supported features. Let's estimate the model performance using cross-validation. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
supported_features = rfe_df[rfe_df.Ranking==1]["Feature/Column"].tolist()
print("3-Fold cross-validation with 5 features")

# 3-Fold cross-validation scored using R^2 score
r2_cross_val = cross_val_score(LinearRegression(),X[supported_features],y,cv=3,scoring="r2")
print("The 3-fold CV R^2 scores are {} \nwith a mean R^2 score of {:.4f}".format(r2_cross_val,np.mean(r2_cross_val)))

# 3-Fold cross-validation scored using RMSE
rmse_cross_val = cross_val_score(LinearRegression(),X[supported_features],y,cv=3,scoring="neg_root_mean_squared_error")
print("The 3-fold CV RMSE scores are {} \nwith a mean RMSE of {:.4f}".format([-i for i in rmse_cross_val],-np.mean(rmse_cross_val)))
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

The RFE method has not performed as well as F-value method which was also validated on 5 features. Clearly, F-value method is a better choice.