### ### Feature Selection in Polynomial Regression
We have simply trained our model on all created features. It should be noted that not all these features will be useful for your model or be able to explain significant variability. Some features may also negatively affect the model performance. To tackle this, we will use feature selection methods are used.

#### Select K Best
In this method, we get top K features from our dataset. Features are evaluated using a score function passed to the `SelectKBest` class object. 

#### F-Value Method
In this method, univariate linear regression tests are performed. Linear models are used for testing the individual effect of each of many regressors(independent variables.).

This is done in 2 steps:

1. The correlation between each regressor and the target is computed.

2. It is converted to an F-score then to a p-value.

F-statistic is the value that you get when you run an ANOVA test or a regression analysis to find out if the means between two populations are significantly different. F-test tells if given variables are jointly significant. 

F-value is the ratio of variance of the group means (Mean Square Between) and mean of the group variances (Mean Squared Error)

If F-value is more than F-statistic, you can reject the null hypothesis. F-values and their resulting p-values are used to score independent variables. We will use the `f_regression()` method with a `SelectKBest` class object to apply F-value method to our data. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
import matplotlib.pyplot as plt
from sklearn.feature_selection import f_regression, SelectKBest


# Feature selection using SelectKBest
# Fit a model using training data using F-value method for top 25 features 
skb = SelectKBest(f_regression,k=25).fit(X_poly2, y)

# Creating dataframe for new features and their respective scores
skb_df = pd.DataFrame({"Feature/Column": ["NewFeat{}".format(i) for i in range(1,X_poly2.shape[1]+1)],"Scores":skb.scores_})

# Plotting a bar plot for top 25 features
skb_df.sort_values("Scores",ascending=True)[:25].set_index("Feature/Column").plot(kind="barh",figsize=(6,8))
plt.title("F-value based Feature Selection scores")

# Saving plot as a PNG file
plt.savefig("Plot1.png")
plt.show()
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}} (This code doesn't produce any new output on the terminal.)

Click and view the newly formed `Plot1.png`{{open}} file from the VScode sidebar.

Let's estimate the results of polynomial regression of top 25 features using k-fold cross-validation. We will use R-squared error and RMSE as scoring metrics. Append the following code to the editor: 

<pre class="file" data-filename="lr.py" data-target="append">
from sklearn.model_selection import cross_val_score

# Gives top 25 features
X_poly2_25 = skb.transform(X_poly2)

print("Cross-validation based on top 25 polynomial features:")

r2_cross_val = cross_val_score(LinearRegression(),X_poly2_25,y,cv=3,scoring="r2")
print("The 3-fold CV R^2 scores are {} \nwith a mean R^2 score of {:.4f}".format(r2_cross_val,np.mean(r2_cross_val)))

rmse_cross_val = cross_val_score(LinearRegression(),X_poly2_25,y,cv=3,scoring="neg_root_mean_squared_error")
print("The 3-fold CV RMSE scores are {} \nwith a mean RMSE of {:.4f}".format([-i for i in rmse_cross_val],-np.mean(rmse_cross_val)))
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

This is a near perfect model with R-squared score close to 1 and RMSE has almost halved when compared to the model with all 2nd degree polynomial features. Let's visualize the results by comparing QQ-plots and residuals.