## Basis vectors
In a vector space V, there exists a set B of vectors such that every vector in V can be described as a linear combination of vectors in set B. This set B is know as basis and the vectors in a basis are called basis vectors. For example, vectors e1 = (1,0) and e2 = (0,1) are two basis vectors of vector space R2.

Any vector v = (a,b) in vector space V can be written as a linear combination:

**v = ae<sub>1</sub> + be<sub>2</sub>**

Following is an example of comparing vectors with their basis vectors:

![Basis vectors 1](./assets/bv1.jpg)

Following is an example of a vector expressed as linear combinations of its basis vectors:

![Basis vectors 2](./assets/bv2.jpg)

## Changing Basis
A vector space can have more than one set of basis vectors. As a vector v in vector space V is expressed as a linear combination of its basis vectors, if we change the basis vectors, the magnitude and direction of the vector will change.

Given a vector v=(1,3) in vector space R<sup>2</sup> where e<sub>1</sub>=(1,0) and e<sub>2</sub>=(0,1) are the basis vectors.

![Basis vectors 3](./assets/bv3.jpg)

We know that,

![Basis vectors 4](./assets/bv4.jpg)

Therefore,

![Basis vectors 5](./assets/bv5.jpg)

Now, new basis vectors b1 and b2 are introduced such that

![Basis vectors 6](./assets/bv6.jpg)

As b<sub>1</sub> and b<sub>2</sub> are also vectors in R<sup>2</sup>, b<sub>1</sub> and b<sub>2</sub> can also be expressed in the form of e<sub>1</sub> and e<sub>2</sub>. Therefore,

![Basis vectors 7](./assets/bv7.jpg)

The columns of this above equation are the new basis vectors. Instead of deriving the above result every time, we can just concatenate the new basis vectors and solve the above equation to get the new coordinates of vector v for the new basis.

![Basis vectors 8](./assets/bv8.jpg)

Let's solve this equation using numpy. Copy the following code to the editor:

<pre class="file" data-filename="vector.py" data-target="replace">
# Importing numpy
import numpy as np
# New basis vectors
b1 = np.array([[1],
              [2]])
b2 = np.array([[2],
              [2]])
# Vector according to the original basis
v = np.array([[1],
            [3]])
# Concatenating new basis
b = np.concatenate((b1,b2),axis=1)

# Solving for vector v according to b1 and b2
new_v = np.linalg.solve(b,v)

# Print vector according to the new basis
print("Vector v with respect to new basis vectors:")
print(new_v)
</pre>

Run `vector.py` using the following command to get results of step 1:

`python3 vector.py`{{execute}}

Therefore, for basis vectors b<sub>1</sub> and b<sub>2</sub>, vector v can be written as:

![Basis vectors 9](./assets/bv9.jpg)

Let's see a visual representation of these vectors. Following is a plot that shows vector v with respect to its original basis vectors:

![Basis vectors 10](./assets/bv10.jpg)

Following is a plot that shows vector v with respect to its new basis vectors:

![Basis vectors 11](./assets/bv11.jpg)