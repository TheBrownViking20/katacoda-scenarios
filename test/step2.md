## Adjacency Matrix
Now, we create adjacency matrix. Adjacency matrix is a N x N matrix where N is the number of points. The rows and columns represent the data points. The value corresponding to the mth row number and nth column number is 1 if there exists a connection or relation betweem data point m and data point n. Else, the value is zero. Since, our data points are independent, we will create connections between them using their radius from their nearest neighbors. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing libraries
# make_moons method creates moon shaped classes of data
from sklearn.datasets import make_moons
import matplotlib.pyplot as plt

# Generating 200 data points
X, y = make_moons(200, noise=.06, random_state=100)

# Creating the adjacency matrix
# Connections are made to neighbors within the radius of 0.3 units
from sklearn.neighbors import radius_neighbors_graph
A = radius_neighbors_graph(X, 0.3, mode='connectivity', metric='minkowski', p=2, include_self=False)

print("Shape of adjacency matrix:",A)

# Visualizing adjacency matrix
import seaborn as sns
sns.heatmap(A.todense())
plt.savefig("image2.jpg")
plt.show()
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any new output in the terminal.)

Click and open the newly formed `image2.jpg`{{open}} in the VScode sidebar to view the heatmap. All the white spaces in the heatmap of the adjacency matrix represent the connections based on radius.

## Degree Matrix
The degree of a node(data point) is the number of edges connected to it. The degree of all the nodes are calculated by taking the sum of each row or each column. Thus, the degree of a node is its corresponding row sum or column. We will use this list of degrees to create a N x N diagonal matrix where the diagonal element to the corresponding node is its degree. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
from sklearn.datasets import make_moons
import numpy as np
import matplotlib.pyplot as plt

X, y = make_moons(200, noise=.06, random_state=100)

# Creating the adjacency matrix
# Connections are made to neighbors within the radius of 0.3 units
from sklearn.neighbors import radius_neighbors_graph
A = radius_neighbors_graph(X, 0.3, mode='connectivity', metric='minkowski', p=2, include_self=False)

# Creating degree matrix
# By calculating degrees using row sum
D = np.diag(A.todense().sum(axis=1).ravel().tolist()[0])

print("Shape of degree matrix:",D)
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

## Graph Laplacian matrix
Graph Laplacian is obtained by subtracting adjacency matrix from degree matrix. Append the following code to the editor:

<pre class="file" data-filename="la.py" data-target="append">
# Calculating Graph Laplacian
L = D - A

# Visualizing adjacency matrix
import seaborn as sns
sns.heatmap(L)
plt.savefig("image3.jpg")
plt.show()
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any new output in the terminal.)

Click and open the newly formed `image3.jpg`{{open}} in the VScode sidebar to view the heatmap.