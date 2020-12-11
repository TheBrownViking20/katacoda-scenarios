## What is digital image processing?
Digital image processing is the process of using a digital computer to process images using various algorithms. Operations like rotation, scaling, skewing, smoothening, sharpening, etc. can be performed on digital images using these algorithms?

## Python for digital image processing
We are using python for digital image processing in this scenario to learn the core technical concepts behind these image processing techniques. We will use libraries like Pillow, numpy and scipy to perform these operations.

## Loading and visualizing images
We will use pillow(PIL) to load an image and matplotlib to visualize it. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing libraries
import numpy as np
import matplotlib.pyplot as plt
from PIL import Image

# Loading image
img = Image.open("./images/img1.jpg") 
img.load()
img_data = np.asarray(img, dtype="int32")

# Visualizing data
plt.imshow(img_data)
plt.savefig("image.jpg") # Saving image as a file
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}} (This code doesn't produce any output in the terminal.)

Open the newly formed `image.jpg`{{open}} to view the newly formed image. You can see the matplotlib based visual of the image. The axes are visible and a white background also appears.

## Image as a matrix
The `img_data` variable used in the above data stores the image as a martix. Grayscale images are represented by a two-dimensional m x n matrix where m and n are the height and width of the image respectively. Each element in the image represents the intensity of the corresponding pixels in the image. This magnitude of intensity ranges from 0 (black color) to 255(white color). Color images are represented by 3 m x n matrices (a three-dimensional matrix). These matrices represent the Red, Green and Blue (RGB color system) colors in the image with their intensities ranging from 0 (minimum) to 255 (maximum). Let's see the shape of the above image. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing libraries
import numpy as np
import matplotlib.pyplot as plt
from PIL import Image

# Loading image
img = Image.open("./images/img1.jpg") 
img.load()
img_data = np.asarray(img, dtype="int32")

# Getting the image shape
print("Shape of the image:",img_data.shape)
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

The shape of the image is represented by a tuple. The first element i.e., number of pixel rows = 960. The second element i.e., number of pixel columns = 640. The third element of the tuple represents the number of color channels i.e., 3 colors (RGB color system). This means that we have a 960 x 640 matrix for each color in the RGB color system.