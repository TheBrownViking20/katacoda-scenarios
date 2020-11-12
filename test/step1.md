## What is a vector space?
A vector space is a set of vectors closed under finite vector addition and vector multiplication. A general example is n-dimensional space R<sup>n</sup>, where every element is represented by a list of real numbers. For a general vector space, the scalars are members of a field F, in which case V is called a vector space over F.

For all elements X,Y,Z in vector space V and any scalars r,s $\epsilon$ F, following conditions must hold:
* Commutativity of vector addition:
**X + Y = Y + X**
* Associativity of vector addition:
**X + (Y + Z) = (X + Y) + Z**
* Additive identity:
**0 + X = X + 0 = X**
* Additive inverse:
**X + (-X) = 0**
* Associativity of vector multiplication:
**r(sX) = (rs)X**
* Distributive over scalar addition:
**(r + s)X = rX + sX**
* Distributive over vector addition:
**r(X + Y) = rX + rY**
* Scalar multiplication identity:
**IX = X**

## Plotting a vector space
Since a vector space is essentially a collection of vectors that meet certain conditions, it is possible to plot them using matplotlib. Below is a visual representation of a vector space consisting of 400 vectors where all vector elements are real numbers lying between -1 and 1. Magnitude of vectors in this vector space can't be greater than 1.

Copy the following code to the editor:

<pre class="file" data-filename="vector.py" data-target="replace">
# Importing matplotlib
import matplotlib.pyplot as plt
# Define origin or location
# This is defined tuple of lists
origin = [0],[0]

# Two arrays of 20 equally spaced elements, np.linspace() provides this functionality
x = np.linspace(-1,1,num=20)
y = np.linspace(-1,1,num=20)

# Nested loops to combine x and y to create 20x20 = 400 vectors for the vector space
# All combinations possible for a 2x1 vector have been covered using the nested loop
# This nested loop creates 400 vectors in the vector space
for i in x: # Runs 20 times
    for j in y: # Runs 20 times every time the above loop runs
        # Transform vector for plotting
        v = [float(i)],[float(j)] # i and j lie between -1 and 1
        # plt.quiver plots vector
        plt.quiver(*origin, *v, color='r', units='xy', angles='xy', scale_units='xy', scale=1)
plt.xlim(-4, 4)
plt.ylim(-4, 4)
plt.xlabel('X')
plt.ylabel('Y')
# Setting aspect ratio for the plot
plt.gca().set_aspect('equal', adjustable='box')
plt.title("2D representation of a vector space")
# Saving image as a PNG file
plt.savefig('2Dvectorspace.png')
plt.show()
</pre>

Run `vector.py` using the following command to get results of step 1:

`python3 vector.py`{{execute}} (This code doesn't produce any output on the terminal.)

Click and view the newly formed `2Dvectorspace.png`{{open}} file from the VScode sidebar.

