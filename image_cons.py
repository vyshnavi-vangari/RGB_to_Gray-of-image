import numpy as np
import matplotlib.pyplot as plt
from scipy import misc
with open('grey.txt',"r") as file:
    data = (file.readlines())
  
data1=np.array(data,dtype=float)

data2=np.resize(data1,(168,300))

plt.imshow(data2,cmap='gray')
plt.figure()

plt.imshow(data2,cmap='binary')

with open('black.txt',"r") as file:
    data = (file.readlines())
    
data1=np.array(data,dtype=float)

data2=np.resize(data1,(168,300))

plt.figure()

plt.imshow(data2,cmap='gray')
plt.show()