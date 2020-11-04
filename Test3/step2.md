

# Vectors and coordinate system
Vectors are plotted using coordinate system. In geometry, coordinate system uses one or more numbers, or coordinates, to determine the position of the points or other geometric elements on a manifold like Euclidean space. On a euclidean space, a vector v = (2,3) can be represented as 2 units on x-axis and 3 units on y-axis. Similarly, a vector w = (2,3,4) can be represented as 2 units on x-axis, 3 units on y-axis and 4 units on z-axis.

## Zero vector
A vector is called a zero vector if all its elements are 0. This is also represented by the origin on the coordinate system. 

## Plotting a vector using Matplotlib
Matplotlib is a data visualization library for python that can be used to visualize vectors.

Vectors are represented as arrows while plotting their positions on a graph. Matplotlib offers quiver plot to plot vectors. Quiver plot accepts the location and directions of the vectors as its parameters.

First, let's plot some vectors in 2 dimensions.

![2D vectors](./assets/2dvectors.jpg)

Copy the following code to the editor:

<pre class="file" data-filename="vector.py" data-target="replace">
# Import the matplotlib library
import matplotlib.pyplot as plt
# Define origin or location
# This is defined tuple of lists
origin = [0],[0]
# Define vectors in same manner
v1 = [4],[3]
v2 = [-3],[3]
v3 = [5],[6]
# Plotting the 3 vectors with matplotlib.quiver
plt.quiver(*origin, *v1, color='r', units='xy', angles='xy', scale_units='xy', scale=1, label='v1 = [4,3]')
plt.quiver(*origin, *v2, color='b', units='xy', angles='xy', scale_units='xy', scale=1, label='v2 = [-3,3]')
plt.quiver(*origin, *v3, color='g', units='xy', angles='xy', scale_units='xy', scale=1, label='v3 = [5,6]')
# units, angles, scale_units and scale are used to scale the graph. Below, the xlim and ylim are also used for the same purpose.
plt.xlim(-8, 8)
plt.ylim(-8, 8)
# Setting location for legend
plt.legend(loc=2)
plt.xlabel('X')
plt.ylabel('Y')
plt.title("2D representation of vectors")
# Saving image as a PNG file
plt.savefig('2Dvectors.png')
plt.show()
</pre>

Run `vector.py` using the following command:
`python3 vector.py`{{execute}}

Click and view the newly formed `2Dvectors.png` file from the VScode sidebar.

## Plotting vectors in 3 dimensions. Given 3 vectors,

![3D vectors](./assets/3dvectors.jpg)

<pre class="file" data-filename="vector.py" data-target="replace">
import matplotlib.pyplot as plt
# mplot3d for 3D plots
from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure(figsize=(8,8))
origin = [0],[0],[0]
v1 = [2],[1],[0]
v2 = [3],[4],[5]
v3 = [5],[5],[5]
# projection='3d' for a three-dimensional graph
ax = fig.add_subplot(111, projection='3d')
ax.quiver(*origin, *v1, color='r', label='v1 = [2,1,0]', arrow_length_ratio=0.2)
ax.quiver(*origin, *v2, color='b', label='v2 = [3,4,5]', arrow_length_ratio=0.05)
ax.quiver(*origin, *v3, color='g', label='v3 = [5,5,5]', arrow_length_ratio=0.05)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_xlim(-6,6)
ax.set_ylim(-6,6)
ax.set_zlim(-6,6)
ax.legend(loc=2)
plt.title("3D representation of vectors")
plt.savefig("3Dvectors.png", dpi=300)
plt.show()
</pre>

Run `vector.py` using the following command:
`python3 vector.py`{{execute}}

Click and view the newly formed `3Dvectors.png` file from the VScode sidebar.
