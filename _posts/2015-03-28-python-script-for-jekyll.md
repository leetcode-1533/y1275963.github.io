---
layout: post
title: "Python script for Jekyll"
description: "This this the collection of the Jekyll scripts"
category: "Jekyll"
tags: []
---
{% include JB/setup %}

All the source code can be found on [Github](https://github.com/y1275963/y1275963.github.io/tree/master/src).

Because Jekyll is a static blog, and many functionalities are constrained due to html. I don't know how to write rake program, but anyway, I managed to use python do the work for me, and I am quite satisfied with the results. 

### Wordpress->Jekyll: Rename Chinese

When I used the wordpress to Jekyll converter, I do get the result, but all the posts with Chinese characters title cannot be opened(404 Error On github host, working fine locally) due to unknow bug, I determined to use regular expression to delete all the Chinese character within the title. And wow! I picked up all my old 56 posts :smile:

{% highlight python linenos %}  
# This is a file that rename the Chinese file name due to the wordpress->Jekyll coversion. 
# Use within the described folder.
# Created a regular expression that remove the "%...%" part

import re
import os

for files in os.listdir("/Users/y1275963/y1275963.github.io/_posts/wordpress"):
    new_name = re.sub('%([^-]*)%', '', files)
    os.rename(files,new_name)
{% endhighlight %}

I know there are still remain some bugs(images and other files are still in the old wordpress site ), but then I asked myself a question. 

>Is to rewrite the old post more important or is it to face the new coming chllange? 

Considering I do have the original copy with me and at the same time it is a pretty complex project to recover from the old post( the files have so many types, and I am not very familiar with the regular expression). I decided to wait until my blog get famious.

### Jekyll Image Google driver uploader

The next thing I want to work on is the blog's image, the static blog don't have the default repo for images, and I decided that I host all my blog images onto Google drive. And Google drive will give me a API url for me to access to all my public images. After a morning work, I managed to do that, and wow, my uploader is just as simple as the one in the wordpress and the data in side is more stable.

{% highlight python linenos %}  
"""
A Script to upload image and build folder according to the markdown file, select markdown file first,
then select the image file. Copy the image file according the markdown file's modifiy_date to google drive
copy the google dirve address to clipboard
"""
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
    return web_repo+str(modifiy_date.year)+'/'+str(modifiy_date.month)+'/'+os.path.basename(img_filename)

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
        if copy_file(mark_filename,img_filename):
            write_to_clipboard(get_clipboard(mark_filename,img_filename))
        else:
            "Failed"
    else:
        "Abandoned"
{% endhighlight %}

To give a demo of how it works, let try to upload a image:
   <figure>
   	<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/3/2015-03-28_13-42-56.png">
   	<figcaption align='middle'><b>Demo</b></figcaption>
   </figure>
   
   <figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/3/IMG_2545.jpg">
<figcaption align='middle'><b>Demo</b></figcaption>
</figure>

This is really satisfying :sunny:

I will keep appending this whenever I got new program. Good thing of using github and google drive is that I don't need to worry about backup.






