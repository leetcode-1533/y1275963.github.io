---
layout: post
status: publish
published: true
title: Bubble Sort
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 290
wordpress_url: http://y1275963.info/wordpress/?p=290
date: '2014-04-27 16:11:22 +0100'
date_gmt: '2014-04-27 08:11:22 +0100'
categories:
- Python
tags: []
comments: []
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--></p>
<div>for i =0 to n-2 do:</div>
<div>     for j =0 to n -2 -i do:</div>
<div>          if a[j+1]&lt;a[j] swap a[j] and a[j+1]</div>
<div>
<hr />
</div>
<div>
<pre class="lang:python decode:true ">__author__ = 'tk'
import random

def sort_selection(my_list):
    for j in xrange(0,len(my_list)-1,1):
        for i in xrange(0,len(my_list)-1-j,1):
            if my_list[i] &gt; my_list[i+1]:
                my_list[i],my_list[i+1] = my_list[i+1],my_list[i]
    return my_list

if __name__ == "__main__":
    tk_list = random.sample(xrange(1000),10)
    print "my_list" + str(tk_list)
    print sort_selection(tk_list)
    print sorted(tk_list)</pre>
<p>&nbsp;</p>
</div>
