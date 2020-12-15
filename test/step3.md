## Eigenvalues and eigenvectors
Eigenvectors are special vectors associated with a linear system of equations and are known as characteristic vectors or proper vectors. Each eigenvector has a corresponding eigenvalue.

x is an eigenvector for a matrix A if

**Ax = 𝜆x**

where 𝜆 is a scalar quantity.

𝜆 can be represented by eigenvalues of matrix A. 

On matrix multiplication of matrix A with x, only the magnitude of the vectors in x changes but the direction remains unchanged. We will use eigenvalues and eigenvectors to determine the threshold for assigning clusters. We will calculate the eigenvalues and eigenvectors of the Graph Laplacian of our data. Copy the following code to the editor:

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

# Calculating Graph Laplacian
L = D - A

# Calculating eigenvalues and eigenvectors
eigenvalues, eigenvectors = np.linalg.eig(L)

# Getting threshold
# Second smallest eigenvalue is chosen
threshold = np.where(eigenvalues == np.partition(eigenvalues,1)[1])
print("Threshold:",threshold[0][0])
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

The first non-zero eigenvalue is the spectral gap which describes the density of the graph. The first eigenvalue is zero or very close. So, the second lowest eigenvalue is chosen as threshold. This is the minimum cut for the graph to get the required clusters with a connected graph.

## Assigning clusters
Using the eigenvector corresponding to the threshold eigenvalue, we will assign the clusters. As the given eigenvector has 200 elements, if the element of eigenvector corresponding to our initial data point is less than or equal to zero, it is assigned cluster 0, else it is assigned cluster 1. Append the following code to the editor:

<pre class="file" data-filename="la.py" data-target="append">
# Assigning clusters
# Using eigenvector corresponding to the threshold eigenvalue
cluster = eigenvectors[:,threshold[0][0]].copy()
cluster[cluster <= 0] = 0
cluster[cluster > 0] = 1

# Visualizing the clusters
plt.scatter(X[:, 0], X[:, 1],c=cluster.flatten().tolist()[0],s=20)
plt.title("Spectral Clustering from scratch")
plt.savefig("image4.jpg") # Saving plot as a file
plt.show()
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any new output in the terminal.)

Click and open the newly formed `image4.jpg`{{open}} in the VScode sidebar to view the plot. The plot is almost identical to that of the original data.