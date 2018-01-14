# -*- coding: utf-8 -*-
"""
Multi-Layer Perceptron with Keras

Using the 'Wine Quality' datasets from UCI Machine Learning Repository<br>
Following Karlijn Willems' DataCamp Tutorial: 
    https://www.datacamp.com/community/tutorials/deep-learning-python

"""
#%% Import
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
#%% Load Data
red = pd.read_csv(r"C:\Users\Avik\Documents\PracticeAndReview\redWine.csv", sep=';')
white = pd.read_csv(r"C:\Users\Avik\Documents\PracticeAndReview\whiteWine.csv", sep = ';')

#%% Explore Data
print(white.info())
print(red.info())

red.head()
red.tail()

red.sample(5)

white.describe(include ='all')
 
pd.isnull(red).values.any()
# if nans do appear, use .isnull().sum().sum() to check how many

#%% Visualze Alcohol
fig, ax = plt.subplots(1,2, sharey=True, figsize = (12,6))
ax[0].hist(red.alcohol, 150, facecolor = 'red', ec = 'black')
ax[1].hist(white.alcohol, 150, facecolor = 'white', label = "White Wine", 
  ec = 'black', lw = .5)
ax[0].set_ylim([0, 250])
ax[0].set_xlabel("Percent ABV")
ax[0].set_ylabel("Frequency")
ax[1].set_xlabel("Percent ABV")
ax[1].set_ylabel("Frequency")
ax[0].set_title("Red Wine")
ax[1].set_title("White Wine")
fig.suptitle("Alcohol Content Distribution")
plt.show()

np.histogram(red.alcohol)

#%% Are Sulphates correlated with quality?

fig,ax = plt.subplots(1,2, figsize = (12,6))
ax[0].scatter(red.quality, red.sulphates, color='r', edgecolor = 'black', lw=.2)
ax[1].scatter(white.quality, white.sulphates, color='w', edgecolor = 'black', lw=.2)
ax[0].set_title("Red Wine")
ax[1].set_title("White Wine")
ax[0].set_xlim([0, 10])
ax[1].set_xlim([0, 10])
ax[0].set_ylim([0,2.5])
ax[1].set_ylim([0, 2.5])
ax[0].set_xlabel("Quality")
ax[1].set_xlabel("Quality")
ax[0].set_ylabel("Sulphates")
ax[1].set_ylabel("Sulphates")
fig.suptitle("Quality vs Sulphates")
fig.subplots_adjust(wspace=0.5)
plt.show()

#%% Preprocess Data for Neural Net

red['color'] = 1
white['color'] = 0
wines = red.append(white, ignore_index = True)

#%% Check for Correlations
import seaborn as sns
corr = wines.corr()
sns.heatmap(corr, cmap = "YlGnBu")
#%% Split into Training / Test data
from sklearn.model_selection import train_test_split
X = wines.iloc[:,0:11]
y = np.ravel(wines.color)
xTrain, xTest, yTrain, yTest = train_test_split(X, y, test_size = .33, random_state = 42)

#%% Standardizing Data
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler().fit(xTrain)
xTrain = scaler.transform(xTrain)
xTest = scaler.transform(xTest)