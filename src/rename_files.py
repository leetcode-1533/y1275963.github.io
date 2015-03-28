# This is a file that rename the Chinese file name due to the wordpress->Jekyll coversion. 
# Use within the described folder.
# Created a regular expression that remove the "%...%" part

import re
import os

for files in os.listdir("/Users/y1275963/y1275963.github.io/_posts/wordpress"):
    new_name = re.sub('%([^-]*)%', '', files)
    os.rename(files,new_name)
