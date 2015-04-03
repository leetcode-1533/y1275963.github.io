"""
A Script to upload image and build folder according to the markdown file, select markdown file first,
then select the image file. Copy the image file according the markdown file's modifiy_date to google drive
copy the google dirve address to clipboard
"""
from Tkinter import Tk
from tkFileDialog import askopenfilename
import magic
import os
import datetime
from PIL import Image
import sys
import shutil
import subprocess


repo = "/Users/y1275963/Google Drive/blog/images"
web_repo = 'https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/'

def modification_date(filename):
    t = os.path.getmtime(filename)
    return datetime.datetime.fromtimestamp(t) 
    
def get_yn():
    yes = set(['yes','y', 'ye', ''])
    no = set(['no','n'])
    print('\n'+'Get copy?')
    choice = raw_input().lower()
    if choice in yes:
       return True
    elif choice in no:
       return False
    else:
       sys.stdout.write("Please respond with 'yes' or 'no'")
       
def copy_file(mark_filename,img_filename):
    modifiy_date = modification_date(mark_filename)  
    target_path = repo +'/'+ str(modifiy_date.year)+'/'+str(modifiy_date.month)+'/'
    target_file = target_path + os.path.basename(img_filename)
    if os.path.isfile(target_file):
        print("File already exist")
        return False
    else:
        if not os.path.exists(target_path):
            os.makedirs(target_path)
        shutil.copy2(img_filename,target_file)
        print("Copied to GOOGLE")
        return True
    
def img_dialog():
    Tk().withdraw() # we don't want a full GUI, so keep the root window from appearing
    filename = askopenfilename(title='Img') # show an "Open" dialog box and return the path to the selected file
    print('--------------To be copied image file---------------------------------')
    print('filename_____'+os.path.basename(filename))
    print('is_____' + magic.from_file(filename))
    print('file_size_____' + str(os.path.getsize(filename)*10**(-6))+'MB')
    print('----------------------------------------------------------------------')
    return filename
    
def mark_dialog():
    Tk().withdraw() # we don't want a full GUI, so keep the root window from appearing
    filename = askopenfilename(title='Markdown',initialdir='/Users/y1275963/y1275963.github.io/_posts') # show an "Open" dialog box and return the path to the selected file
    print('----------------Markdown file ----------------------------------------')
    print('filename_____'+filename)
    print('is_____' + magic.from_file(filename))
    print('----------------------------------------------------------------------')      
    return filename
    
def get_clipboard(mark_filename,img_filename):
    modifiy_date = modification_date(mark_filename)
    figure_p1 = '<figure>\n<img src="'
    figure_p2 = '">\n<figcaption align=\'middle\'><b>Demo</b></figcaption>\n</figure>'

    url =  web_repo+str(modifiy_date.year)+'/'+str(modifiy_date.month)+'/'+os.path.basename(img_filename)

    return figure_p1 + url + figure_p2

def write_to_clipboard(output):
    process = subprocess.Popen(
        'pbcopy', env={'LANG': 'en_US.UTF-8'}, stdin=subprocess.PIPE)
    process.communicate(output.encode('utf-8'))
    
if __name__ == "__main__" :
    #img = Image.open(filename)
    #img.show()
    mark_filename = mark_dialog()
    img_filename =  img_dialog()
    
    if get_yn() == True:
    # Copy to the clipboard no maater it is success or not 
        copy_file(mark_filename,img_filename)
        write_to_clipboard(get_clipboard(mark_filename,img_filename))
    else:
        print "User say 'No'"
        
           
