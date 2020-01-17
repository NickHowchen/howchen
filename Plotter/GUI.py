
from tkinter import *
from tkinter import filedialog
from tkinter import messagebox

import pandas as pd

win = Tk()
win.geometry("350x350")
win.title("SNT DDF Plotter")
win.configure(background='black')

file = None
label_style = {"bg":"black","fg":"white","font":"-size 30 -weight bold"}
button_style1 = {"bg":"red","fg":"white","font":"-size 15 - weight bold"}
button_style2 = {"bg":"green","fg":"white","font":"-size 15 - weight bold"}

def browse():
    global files
    files = filedialog.askdirectory()
        

#def plot():
 #call plotter module here



label - Label(win, text='SNT DDF Plotter', **label_style)
button1 = Button(win, text='"Choose DDF files folder', command=browse, **button_style1)
#button2 = Button(win, text='"PLot DDFs', command=plot, **button_style2) #command = def plot()

label.place(x=5, y=50)
button1.place(x=5, y=130)
button2.place(x=85,y=190)

win.mainloop()

