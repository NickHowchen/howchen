import plotly.graph_objects as go
import csv #csv reader but works on tab delimited files also
import pandas as pd
import glob
import os
from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
import pylab
import numpy as np
import tkinter
import tkinter.messagebox
from tkinter import *

filecount = 0



path = r'U:\SNT Plotter\DDFs'                     # use your path
all_files = glob.glob(os.path.join(path, "*.ddf"))     # advisable to use os.path.join as this makes concatenation OS independent
filenamelist = []
for filename in os.listdir(path):
    if filename.endswith('.ddf'):
      filenamelist.append(filename[:-4])
df_from_each_file = (pd.read_csv(f, encoding='ansi', header=26, delimiter='\t') for f in all_files) #reads in entire ddf starting from row 26 ie skipping metadata
conc_df = pd.concat(df_from_each_file, ignore_index=True, axis=1) # concatenates into one big file. includes all 4 columns of length/temp/stokes/astokes
pd.set_option('display.max_rows',50)#for debugging/checking files are being read correctly
pd.set_option('display.min_rows',40)#for debugging/checking files are being read correctly
#print(conc_df)#for debugging/checking files are being read correctly
filecount = int((len(conc_df.columns) /4)) #filecount for later plotting, divided by 4 to account for 4 columns

#print(filecount) #checking filecount



numrows = conc_df.shape[0] -1

for m in range(0,numrows):
    if conc_df.iloc[m,0] < 0: #look for zero point
        continue
    elif conc_df.iloc[m,0] >= 0: # break loop once its found
        break

conc_df = conc_df.iloc[m:,] # delete < 0 rows
#copy first column(lengths) to seperate df
lengths_df = pd.DataFrame()
lengths_df = conc_df.iloc[:,0].copy() #create 1Col x N row df with all lengths contained without removing it from conc_df  
#print(conc_df)

for n in range(0,int(filecount)):
    conc_df= conc_df.drop([conc_df.columns[n], conc_df.columns[n+2], conc_df.columns[n+3]], axis='columns') #drop all length, stokes, astokes columns and create df of just temps
#print(conc_df)    

stats =[20]
 #placeholder value
#stats[0] = maxtemp
#stats[1] = mintemp
cmax = rmax = 0

for n in range(0, int(filecount)): # check each column 
    maxCols = conc_df[n].max(axis = 1, numeric_only=True)
    if maxCols > cmax:
        cmax = maxCols



for n in range(0, conc_df.shape[0]):
    maxRows = conc_df[n].max(axis = 0, numeric_only=True)
    if maxRows > rmax:
        rmax= maxRows



stats[0] = max(rmax, cmax)

minRows =conc_df.min(axis = 0)
minCols = conc_df.min(axis = 1)
stats[1] = max(minRows, minCols)



x=lengths_df.iloc[:]

fig = go.Figure()
for a in range(0,filecount):
    fig.add_trace(go.Scatter(x=x,y=conc_df.iloc[:,a], mode='lines', name=filenamelist[a]))

fig.update_layout(title='Sensornet Interactive DDF Plotter', xaxis_title = 'Metres', yaxis_title='Temperature (Celcius)')
fig.show(config={'scrollZoom': True})


#create stats messagebox window
window = tkinter.Tk()
window.title("Statistics for these files")
window.geometry('500x500')
lbl1 = Label(window, text = "Statistics")
lbl1.grid(column = 0, row = 0)
lbl2 = Label(window, text = "Maximum Temperature is {}".format(stats[0])) 
lbl2.grid(column = 1, row = 1)
lbl2 = Label(window, text = "Minimum Temperature is {}".format(stats[1])) 
lbl2.grid(column = 1, row = 1)
window.mainloop()