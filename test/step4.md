## Spectral Clustering by Scikit-learn
Let's compare our results with Scikit-learn's spectral clustering implementation. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing libraries
# make_moons method creates moon shaped classes of data
from sklearn.datasets import make_moons 
from sklearn.cluster import SpectralClustering
import matplotlib.pyplot as plt

# Generating 200 data points
X, y = make_moons(200, noise=.06, random_state=100)

# Applying Spectral Clustering on data (X)
sc = SpectralClustering(n_clusters=2, affinity='nearest_neighbors', assign_labels='kmeans').fit(X)

# Getting clusters
cluster = sc.labels_

# Visualizing the clusters
plt.scatter(X[:, 0], X[:, 1],c=cluster,s=20)
plt.title("Spectral Clustering: Scikit-learn")
plt.savefig("image5.jpg") # Saving plot as a file
plt.show()

</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any new output in the terminal.)

Click and open the newly formed `image5.jpg`{{open}} in the VScode sidebar to view the plot. This plot is identical to our approach.

## KMeans Clustering by Scikit-learn
Now, let's compare our results with Scikit-learn's KMeans clustering implementation. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing libraries
# make_moons method creates moon shaped classes of data
from sklearn.datasets import make_moons 
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# Generating 200 data points
X, y = make_moons(200, noise=.06, random_state=100)

# Applying KMeans Clustering on data (X)
km = KMeans(n_clusters=2).fit(X)

# Getting clusters
cluster = km.labels_

# Visualizing the clusters
plt.scatter(X[:, 0], X[:, 1],c=cluster,s=20)
plt.title("KMeans Clustering: Scikit-learn")
plt.savefig("image6.jpg") # Saving plot as a file
plt.show()
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any new output in the terminal.)

Click and open the newly formed `image6.jpg`{{open}} in the VScode sidebar to view the plot. This plot is very different from the plot of our spectral clustering approach and original data due to KMeans algorithm's dependence on euclidean distance. It's not wrong. It's just different.