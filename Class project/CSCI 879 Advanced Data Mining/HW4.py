#!/usr/bin/env python
# coding: utf-8

# In[3]:


import scipy.io as sio 
import numpy as np
import networkx as nx
import matplotlib.pyplot as plt #for ploting
import math #logarithmic  computation
matFile = sio.loadmat("Homo_sapiens.mat") # read mat file


# In[4]:


matFile


# In[5]:


network=matFile["network"].todense()


# In[46]:


with open("directed_network.txt","w") as wf:
    for i in range(0,3890):
        for j in range(0,3890):
            wf.write("\t".join([str(i),str(j),str(network[i,j])]))
            wf.write("\n")


# In[6]:


with open("directed_network_node2vec.txt","w") as wf:
    for i in range(0,3890):
        for j in range(0,3890):
            if network[i,j] > 0.00001:
                wf.write("\t".join([str(i),str(j)]))
                wf.write("\n")


# In[55]:


get_ipython().system('python2 ~/Desktop/externalDisk/node2vec/src/main.py --input ./directed_network_node2vec.txt --output ./node2vec.emd --dimensions 2 --walk-length 40  --workers 12 --directed')


# In[57]:


get_ipython().system('deepwalk --format mat --input Homo_sapiens.mat --max-memory-data-size 15000000 --number-walks 80 --representation-size 2 --walk-length 40 --window-size 10 --workers 12 --output ./deepwalk.embeddings')


# In[50]:


get_ipython().system('./line -train directed_network.txt -output line.emb -binary 0 -size 2 -order 2 -negative 5 -sample 1')


# In[7]:


get_ipython().system('head deepwalk.embeddings')


# In[12]:


get_ipython().system('head line.emb')


# In[13]:


get_ipython().system('head node2vec.emd')


# In[43]:


nodeID = []
coordinate1 = []
coordinate2 = []
with open("line.emb","r") as rf:
    rf.readline()
    for line in rf:    
        x, y, z = line.strip().split(" ")
        nodeID.append(x)
        coordinate1.append(y)
        coordinate2.append(z)

coordinate1 = list(map(float, coordinate1))
coordinate2 = list(map(float, coordinate2))

plt.scatter(coordinate1[:],coordinate2[:])
plt.show()


# In[44]:


nodeID = []
coordinate1 = []
coordinate2 = []
with open("deepwalk.embeddings","r") as rf:
    rf.readline()
    for line in rf:    
        x, y, z = line.strip().split(" ")
        nodeID.append(x)
        coordinate1.append(y)
        coordinate2.append(z)

coordinate1 = list(map(float, coordinate1))
coordinate2 = list(map(float, coordinate2))

plt.scatter(coordinate1[:],coordinate2[:])
plt.show()


# In[45]:


nodeID = []
coordinate1 = []
coordinate2 = []
with open("node2vec.emd","r") as rf:
    rf.readline()
    for line in rf:    
        x, y, z = line.strip().split(" ")
        nodeID.append(x)
        coordinate1.append(y)
        coordinate2.append(z)

coordinate1 = list(map(float, coordinate1))
coordinate2 = list(map(float, coordinate2))

plt.scatter(coordinate1[:],coordinate2[:])
plt.show()


# ### During the installation of LINE, gsl library was required, and I tried to install gsl-2.5. However, compiled program was still not excutable. Finally, I found 'gsl-bin' in apt-get, and LINE was runable after installation of 'gsl-bin'.
# ### Conda create was used for create isolated environment for different Python version.
# ### deepwalk and node2vec require two different versions of gensim

# ### Node2vec and LINE finished job quickly, and Deepwalk took much long time.

# In[ ]:




