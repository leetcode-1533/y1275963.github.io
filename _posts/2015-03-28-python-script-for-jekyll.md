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

{% highlight python %}  
import re
import os

for files in os.listdir("/Users/y1275963/y1275963.github.io/_posts/wordpress"):
    new_name = re.sub('%([^-]*)%', '', files)
    os.rename(files,new_name)
{% endhighlight %}

I know there are still remain some bugs(images, files), but then I asked myself a question. Is to rewrite the old post more important or is it to face the new coming chllange? Considering I do have the original copy with me and at the same time it is a pretty complex project to recover from the old post( the files have so many types, and I am not very familiar with the regular expression). I decided to wait until my blog get famious.

### Jekyll Image Google driver uploader

The next thing I want to work on is the blog's image, the static  



