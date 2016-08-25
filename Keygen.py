#!/usr/bin/python
import Tkinter
# from PIL import ImageTk


class simpleapp_tk(Tkinter.Tk):
    def __init__(self, parent):
        """Each gui element has a container which explains the parent parameter"""
        Tkinter.Tk.__init__(self, parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        """Initiate the Elelemts of the GUI
        """
        #  The window will be in grid layout
        self.grid()
        # img = ImageTk.PhotoImage(file="logo.png")
        label = Tkinter.Label(self,text="Welcome",bg="blue")
        label.grid(column=0,row=1,columnspan=2,sticky='EW')

        self.nameLabel = Tkinter.Label(self,text="Name:")
        self.nameLabel.grid(row=2)

        self.nameEntry = Tkinter.Entry(self)
        self.nameEntry.insert(0,"Enter a name")
        self.nameEntry.config(fg="#a1a1a1")
        self.nameEntry.pack()
        self.nameEntry.grid(column=1,row=2)
        self.nameEntry.bind("<Return>", self.__OnPressEnter)  # (lambda event: self.__OnPressEnter(self))
        self.nameEntry.bind("<Button>", self.__delph)

        self.label_s = Tkinter.Label(self,text="Serial")
        self.label_ser = Tkinter.Label(self,text="Testing")

        button = Tkinter.Button(self,text=u"Generate !",command=self.__OnButtonClick)
        button.grid(columnspan=2,row=4)

        self.grid_columnconfigure(0,weight=1)

    def __OnPressEnter(self,event):
        self.__OnButtonClick()

    def __delph(self,event):
        self.nameEntry.delete(0,Tkinter.END)
        self.nameEntry.config(fg="#000000")

    def __OnButtonClick(self):
        uname = self.nameEntry.get()
        if(uname == "Enter a name"):
            return
        algo = generate_Serial(uname)
        self.serial = algo.generate()
        self.label_s.config(text="Serial")
        if(self.serial == 0):
            self.label_ser.grid_forget()
            self.label_s.config(text="Enter different uname")
            return
        self.label_ser.config(text=self.serial)
        self.label_s.grid(row=3,column=0)
        self.label_ser.grid(row=3,column=1)
        self.update_idletasks()


class generate_Serial():
    def __init__(self,uname):
        self.name = uname

    def __algo1(self,name):
        esi = 4
        ecx = 0
        ebx = 0
        letter = name
        strlength = len(letter)
        while(ebx < strlength):
            char = letter[ebx]
            ebx += 1
            eax = ord(char) * esi
            esi += 4
            edx = eax << 4
            edx -= eax
            eax = 0x68db8bad
            ecx = edx + ecx + 0x29a
            prod = ecx * eax
            eax = ecx >> 0x1f  # eax = eax >> 0x1f
            edx = prod >> 32
            edx = edx >> 0x0c
            edx -= eax
            eax = ecx
            edx = edx * 0x00002710
            eax -= edx
            res = eax
        return res

    def __algo2(self,name):
        esi = 4
        ecx = 0
        ebx = 0
        letter = name
        strlength = len(letter)
        while(ebx < strlength):
            char = letter[ebx]
            ebx += 1
            eax = ord(char) * esi
            esi += 0x08
            edx = eax + (eax + eax * 4) * 2 + 0x2d
            ecx += edx
            prod = ecx * 0x68db8bad
            eax = ecx >> 0x1f
            edx = prod >> 32
            edx = edx >> 0x0c
            edx -= eax
            eax = ecx
            edx = edx * 0x00002710
            eax -= edx
            res = eax
        return res

    def generate(self):
        nib1 = self.__algo1(self.name)
        if(len(str(nib1)) != 4):
            return 0
        nib2 = self.__algo2(self.name)
        if(len(str(nib2)) != 4):
            return 0
        return str(nib1) + str(nib2)


def center(toplevel):
    toplevel.update_idletasks()
    w = toplevel.winfo_screenwidth()
    h = toplevel.winfo_screenheight()
    size = tuple(int(_) for _ in toplevel.geometry().split('+')[0].split('x'))
    x = w / 2 - size[0] / 2
    y = h / 2 - size[1] / 2
    print size
    toplevel.geometry("%dx%d+%d+%d" % (size + (x, y)))

if __name__ == "__main__":
    app = simpleapp_tk(None)
    app.title('Serial Generator')
    app.geometry("239x100")
    center(app)
    app.mainloop()
