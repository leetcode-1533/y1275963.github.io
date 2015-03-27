---
layout: post
status: publish
published: true
title: merge_sort
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 300
wordpress_url: http://y1275963.info/wordpress/?p=300
date: '2014-04-27 17:38:47 +0100'
date_gmt: '2014-04-27 09:38:47 +0100'
categories:
- y1275963
tags: []
comments:
- id: 133
  author: 服装搭配技巧
  author_email: 2961986469@qq.com
  author_url: http://www.oradre.com
  date: '2014-05-01 22:46:53 +0100'
  date_gmt: '2014-05-01 14:46:53 +0100'
  content: |-
    程序工作者，辛苦了，谢谢分享.
    加油!!也希望楼主有空去我网站玩玩。www.oradre.com
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--></p>
<div>Due to some pointer issues, I changed the pointing to method(which means make changes within the function) into returning a new value:</div>
<div></div>
<div>
<h1>pseudocode:</h1>
<div></div>
<div>
<pre class="lang:delphi decode:true crayon-selected">
def mergesort(a)
if len(a)&gt;1:
     copy a[0…[n/2]-1) to b
     copy a[[n/2]…n-1) to c
     sortedb = mergesort(b)
     sortedc = mergesort(c)
     return merge(b,c)
else:
     return a 
def merge(b,c):
     i = 0
     j = 0
     k = 0
     a = []
     while i &lt; len(b) and j &lt; len(c):
          if b[i] &lt;= c[j]:
               a[k] = b[i];
               i = i + 1
          else:
               a[k] = c[j]
               j = j+1
          k = k +1
     if i == p:
          a.extend(c[j…cend])
     else:
          a.extend(b[i…bend])
     return a</pre>
<h1> python:</h1>
</div>
</div>
<div>
<pre class="lang:python decode:true">__author__ = 'tk'

import random

def merge(test1,test2):
    i , j , k = 0 , 0 , 0
    arr = []
    lens1 = len(test1)
    lens2 = len(test2)
    while i&lt;lens1 and j&lt;lens2:
        if test1[i] &lt; test2[j]:
            arr.append(test1[i])
            i = i+1
        else:
            arr.append(test2[j])
            j = j +1
    if i==lens1:
        arr.extend(test2[j::])
    else:
        arr.extend(test1[i::])
    return arr

def mergesort(my_list):
    if len(my_list) &gt; 1:
        blist = my_list[0:len(my_list)/2:1]
        clist = my_list[len(my_list)/2::1]
        bsorted = mergesort(blist)
        csorted = mergesort(clist)
        return merge(bsorted,csorted)
    else:
        return my_list

if __name__ == "__main__":
    tk_list = random.sample(xrange(1000),10)
    print "my_list" + str(tk_list)
    print mergesort(tk_list)
    print sorted(tk_list)</pre>
<p>&nbsp;</p>
</div>
