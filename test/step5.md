### Model Evaluation

**Residuals** are prediction errors i.e., difference between the observed value and the predicted value.

Residuals are used in various performance metrics and can be used to visualize model performance. A resdiuals plot shows residuals on the vertical axis and predicted values on the horizontal axis. In a ideal residuals plot, the distribution of residuals around the target is random and uniformly centered around zero. A good model leads to constant variability in the residuals plot.

Let's compare residual plots for our multiple linear regression model and polynomial regression model. Append the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="append">
# Residuals plot
plt.figure(figsize=(15,4))

plt.scatter(y_pred,y_test-y_pred,color="red", label="Multiple Linear Regression")
plt.scatter(poly_pred,y_test-poly_pred,color="blue", label="2nd Degree Polynomial Regression")

plt.title("Residuals plot")
plt.legend()
plt.xlabel("Predicted value")
plt.ylabel("Residuals")

# Saving plot as a PNG file
plt.savefig("Plot3.png")
plt.show()
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}} (This code doesn't produce any new output on the terminal.)

Click and view the newly formed `Plot3.png`{{open}} file from the VScode sidebar.

The residuals plot of polynomial regression has all positive values and the residuals are much closer to zero as compared to the residuals plot of multiple linear regression. The polynomial regression model has performed much better.