## What is clustering?
In the world of data science, clustering involves dividing the given data points into clusters(groups) such that data points in the same cluster are more similar to other data points in the same cluster than those in a different cluster. Clustering is useful in decoding hidden patterns in the data. On a high-level in real-world situations, these patterns and insights can be translated into profitable business decisions. For example, clustering can be done by marketers on customer data based on their purchasing patterns to get actionable insights for future sales and marketing campaigns. KMeans and Spectral clustering are some of the popular clustering algorithms. 

## How is Spectral clustering different?
KMeans clustering considers the euclidean distance between different data points to compute clusters. Spectral clustering on the other hand, is based on graph theory and computes clusters based on communities of nodes inter-connected with each other. In other words, KMeans works well for independent data points but Spectral clustering can be used for inter-relatred data points. As the algorithm is flexible, we can even use it for independent data points.

## Using graphs for clustering
Graphs represent in the form of nodes(data points). Some of these nodes may be connected to each other through a set of edges. These edges can be directed (unidirectional) or undirected (birdirectional) and can even have weights associated with them. We will use some concepts of graph theory in our implementation.  

## Spectral clustering from scratch
To better understand the concepts of linear algebra and graph theory used in spectral clustering, we will implement it from scratch. Let's start by getting data for clustering.

## Generating data
Scikit-learn provides different methods for generating data. We will generate data with 2 classes (clusters) for implementing the spectral clustering algorithm. We are generating our own random data to compare the resulting clusters with the labels of the generated data. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing libraries
# make_moons method creates moon shaped classes of data
from sklearn.datasets import make_moons 

# Generating 200 data points
X, y = make_moons(200, noise=.06, random_state=100)

# Printing shape of data and labels
print("Shape of data X:",X.shape)
print("Shape of labels y:",y.shape)

# First 10 rows of data and labels
print("Sample of data:", X[:10])
print("Sample of labels:", y[:10])
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

Observe the output of the above code. We have generated 200 data points. Each data point consists of 2 features (numpy array X) and a corresponding label (numpy array y). We will train our clustering data using the 2 features of the data points. 

Let's visualize our data. Append the following code to the editor:

<pre class="file" data-filename="la.py" data-target="append">
# Importing libraries
import numpy as np
import matplotlib.pyplot as plt

# Visualizing data
# X[:,0] is the first feature, X[:,1] is the second feature
# y (labels) passed as color to distinguish between the desired clusters
plt.scatter(X[:, 0], X[:, 1],c=y,s=20)
plt.title("Generated data")
plt.savefig("image1.jpg") # Saving plot as a file
plt.show()
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any new output in the terminal.)

Click and open the newly formed `image1.jpg`{{open}} in the VScode sidebar to view the newly formed image. We can see 2 distinguished clusters in the plot.