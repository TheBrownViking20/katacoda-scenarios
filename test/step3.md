### Taking predictions
We will take predictions using the following equation for multiple linear regression.

![n2](./assets/n2.jpg)

 We will use `X_test` to take predictions and then compare the predictions with the actual values, `y_test`. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
scratch_pred = []
# Calculation prediction for each row of X_test
for i in range(len(X_test)):
    # Calculations based on the above equation
    dot_product = X_test.iloc[i,:].values.dot(np.array(thetas))
    prediction = intercept + dot_product
    
    # Append prediction
    scratch_pred.append(prediction)
scratch_pred = np.array(scratch_pred)
print("Shape of predictions:",scratch_pred.shape)
print("_____________________")
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

Now, we have the predictions too. Let's evaluate our approach with the linear model.