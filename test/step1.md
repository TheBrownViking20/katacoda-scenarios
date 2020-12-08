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
img = Image.open("img1.jpg") 
img.load()
img_data = np.asarray(img, dtype="int32")

plt.imshow(img_data)
plt.savefig("image.jpg")
</pre>