### Train/test split
Data is divided into training and test sets. The training set is used to train the linear model and the test set is used evaluate the trained model. Here, we are using 70% data in the training set, leaving 30% data for the test set. The train-test set ratio is determined keeping in mind the size of data. Larger test sets (around 20-30% data) provide more reliable evaluation results but, at the same time, the training set should be enough so that underfitting does not occur.

Scikit-learn provides `train_test_split()` method to efficiently split data into train and test set. Copy the following code to the editor:

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
# A 70/30 train/test split
X_train, X_test, y_train, y_test = train_test_split(X, y,
                                                    test_size=0.3,
                                                    random_state=100,
                                                    shuffle=True)

print("Shape of X_train:", X_train.shape)
print("Shape of X_test:", X_test.shape)
print("Shape of y_train:", y_train.shape)
print("Shape of y_test:", y_test.shape)
</pre>

Run `lr.py` using the following command:

`python3 lr.py`{{execute}}

`X_train` and `y_train` form the training set and contain 70% of the data while `X_test` and `y_test` form the test set and contain 30% of the data, as seen in the output of the above code. 