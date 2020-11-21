### Taking predictions
We can use `predict()` method to take predictions of the test set. Let's calculate predictions for our model. Copy the following code to the editor:

<pre class="file" data-filename="lr.py" data-target="replace">
# Importing pandas
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


# Comparing shapes of predicted and real values
print("Shape of y_test:", y_test.shape)
print("Shape of y_pred:", y_pred.shape)
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

In the output of the above code, we can see that the predictions(y_pred) and the real values(y_test) have the same shape. 