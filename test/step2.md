### Cross-validation
How can we be sure that this model gives at least similar performance on other data samples with same parameters using different training samples? As a data scientist, we must ensure that our model gives similar performance for any data sample, seen or unseen before. Therefore, to estimate the skill of our machine learning models, we use cross validation. Cross-validation is a resampling procedure where we measure the performance of our model by training and testing it on different data samples from the available data. A good model's performance will remain similar no matter what data sample is used.

### k-Fold Cross-validation
We will be using k-Fold cross-validation for estimating our model's performance. In k-Fold cross-validation, data is divided into `k` sets. It is trained `k` times taking a different set of k-1 sets for training and testing on the 1 remaining set. `k` should be selected keeping in mind the size of the available dataset.

If k=4 is selected,
1. Iteration 1 - Training on (Fold 1, Fold 2, Fold 3), Testing on Fold 4
2. Iteration 2 - Training on (Fold 2, Fold 3, Fold 4), Testing on Fold 1
3. Iteration 3 - Training on (Fold 3, Fold 4, Fold 1), Testing on Fold 2
4. Iteration 4 - Training on (Fold 4, Fold 1, Fold 2), Testing on Fold 3

We will use k-fold cross-validation with 3 folds as then the training set size will be 66% which is closest to the 70% training set size of the original model. Scikit-learn provides `cross_val_score()` method for k-fold cross validation which accepts the model object, dependent and indpendent variables, number of folds, and the scoring metric. This returns a list of each fold's calculated scoring metric. We will perform cross-validation for both R-squared score and RMSE. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
# Importing cross-validation method from scikit-learn
from sklean.model_selection import cross_val_score

# 3-Fold cross-validation scored using R^2 score
r2_cross_val = cross_val_score(LinearRegression(),X,y,cv=3,scoring="r2")
# Printing scoring metric for each fold and mean of scoring metrics
print("The 3-fold CV R^2 scores are {} \nwith a mean R^2 score of {:.4f}".format(r2_cross_val,np.mean(r2_cross_val)))

# 3-Fold cross-validation scored using RMSE
rmse_cross_val = cross_val_score(LinearRegression(),X,y,cv=3,scoring="neg_root_mean_squared_error")
print("The 3-fold CV RMSE scores are {} \nwith a mean RMSE of {:.4f}".format([-i for i in rmse_cross_val],-np.mean(rmse_cross_val)))
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

We can see that the performance of our model on all 3 folds is very similar to that on the original 70/30 split shown above, although RMSE for each fold is more than our original model. We might be overfitting with the baseline model.

