## Evaluating different approaches
We will use silhouette score to compare the performance of the different approches used in this tutorial. Silhouette score compares how similar a data point is to its cluster compared to other clusters. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
from sklearn.datasets import make_moons 
from sklearn.neighbors import radius_neighbors_graph
from sklearn.metrics import silhouette_score
from sklearn.cluster import KMeans, SpectralClustering
import numpy as np
import matplotlib.pyplot as plt

X, y = make_moons(200, noise=.06, random_state=100)

# Creating the adjacency matrix
# Connections are made to neighbors within the radius of 0.3 units
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

cluster = eigenvectors[:,1].copy()
cluster[cluster <= 0] = 0
cluster[cluster > 0] = 1

# Applying Spectral Clustering on data (X)
sc = SpectralClustering(n_clusters=2, affinity='nearest_neighbors', assign_labels='kmeans').fit(X)

# Getting clusters
sc_clusters = sc.labels_

# Applying KMeans Clustering on data (X)
km = KMeans(n_clusters=2).fit(X)

# Getting clusters
km_clusters = km.labels_

# Calculating silhouette scores
silhouettes = []
silhouettes.append(silhouette_score(X,y))
silhouettes.append(silhouette_score(X,cluster))
silhouettes.append(silhouette_score(X,sc_clusters))
silhouettes.append(silhouette_score(X,km_clusters))

# Plotting results
plt.barh(["Original","Spectral Clustering: Scratch","Spectral Clustering: Scikit-learn","KMeans Clustering"],silhouettes)
plt.savefig("image7.jpg") # Saving plot as a file
plt.show()
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any new output in the terminal.)

Click and open the newly formed `image7.jpg`{{open}} in the VScode sidebar to view the plot. According to the plot, the silhouette scores of original data and both spectral clustering approaches is same. This means we have successfully implemented the spectral clustering algorithm. However, KMeans clustering has the highest score. It means that KMeans clustering is the more suited algorithm for clustering on this data.