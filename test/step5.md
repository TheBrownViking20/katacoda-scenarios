## Some numpy methods for matrices
Below are some methods provided by numpy useful in matrix based operations.

### Getting diagonal of a matrix: numpy.diag
This method extracts a diagonal from a matrix. Diagonal elements of a matrix have the same row and column index. Let's see an example in numpy. Copy the code below to the editor:

<pre class="file" data-filename="matrix.py" data-target="replace">
import numpy as np
# Create a matrix A
A = np.matrix([[2,4,6,23,78],
              [6,35,7,30,12],
              [8,3,5,17,56],
              [48,21,87,7,33],
              [11,55,67,78,98]])
# Getting the diagonal
print(np.diag(A))
</pre>

Run `matrix.py` using the following command:

`python3 matrix.py`{{execute}}

### Getting upper and lower triangle of a matrix: numpy.triu and numpy.tril
`np.triu` returns upper triangle at and above the main diagonal for the given matrix. All other elements are returned as 0. `np.tril` returns lower triangle at and below the main diagonal for the given matrix. Let's see an example in numpy. Copy the code below to the editor:

<pre class="file" data-filename="matrix.py" data-target="replace">
import numpy as np
# Create a matrix A
A = np.matrix([[2,4,6,23,78],
              [6,35,7,30,12],
              [8,3,5,17,56],
              [48,21,87,7,33],
              [11,55,67,78,98]])
# Print matrix A
print(A)
# Getting the upper triangle
print("Upper triangle")
print(np.triu(A))
# Getting the lower triangle
print("Lower triangle")
print(np.tril(A))
</pre>

Run `matrix.py` using the following command:

`python3 matrix.py`{{execute}}

### Getting the transpose of a matrix: numpy.transpose
Transpose operation flips a matrix over its diagonal i.e., the row and column indices are switched. Only diagonal elements of a square matrix retain their original position after transposing. Let's see an example of matrix transposition in numpy. Copy the code below to the editor:

<pre class="file" data-filename="matrix.py" data-target="replace">
import numpy as np
# Create a matrix A
A = np.matrix([[2,4,6,23,78],
              [6,35,7,30,12],
              [8,3,5,17,56],
              [48,21,87,7,33],
              [11,55,67,78,98]])
# Print matrix A
print(A)
# Getting the transpose
print("Transpose of matrix A")
print(np.transpose(A))
</pre>

Run `matrix.py` using the following command:

`python3 matrix.py`{{execute}}