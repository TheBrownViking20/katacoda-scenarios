## Inverse of a matrix
According to Wikipedia, a square matrix is called invertible, if there exists a square matrix B such that

**AB = BA = I**

where I is the identity matrix. Here, B is the multiplicative inverse of A, denoted by A<sup>-1</sup>. Therefore,

**AA<sup>-1</sup> = A<sup>-1</sup>A = I**

### Finding inverse of a matrix using Gauss-Jordan elimination method
In Gauss-Jordan elimination method, an invertible matrix M is augmented by concatenating M with its equivalent identity matrix side-by-side. Then, elementary operations are performed on the augmented matrix in order to transform M into the identity matrix. Consequently, the identity matrix on the right is converted into the inverse of matrix M. 

There are three kinds of elementary operations:
* Swapping two rows
* Adding(or subtracting) a multiple of one row to the other
* Multiple one row with a non-zero scalar

Let's calculate the inverse for a 3 $\times$ 3 matrix using numpy and gaussian elimination. Following is a matrix M and the augmented matrix (M|I) to be used for gaussian elimination.