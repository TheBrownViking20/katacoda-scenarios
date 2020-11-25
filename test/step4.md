### Model evaluation

Let's start by evaluating our approach using R-squared score and RMSE. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
# For the metrics
from sklearn.metrics import r2_score, mean_squared_error

print("Evaluation of normal equation based model")
print("The R-squared score is {:.4f}".format(r2_score(y_test,scratch_pred)))
print("The Root Mean Squared error is {:.4f}".format(np.sqrt(mean_squared_error(y_test,scratch_pred))))
print("Intercept =",intercept)
model_coefs_scratch = pd.DataFrame({'Feature/Column': list(X_train.columns), 'Coefficient': thetas})
print(model_coefs_scratch)
print("_____________________")
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

The normal equation appproach built from scratch gives almost identical results to the Scikit-learn model. We can calculate RMSE between the scikit-learn model and normal equation model to check difference in their predictions. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
# Comparing both models using RMSE
print("The Root Mean Squared error is {:.4f}".format(np.sqrt(mean_squared_error(multiple_lr_preds,multiple_lr_scratch_preds))))
print("_____________________")
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

As the RMSE is 0.0, we have successfully replicated the Scikit-learn model using a normal equation-based approach from scratch using numpy.