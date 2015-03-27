---
layout: post
status: publish
published: true
title: Insertion Sort
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 316
wordpress_url: http://y1275963.info/wordpress/?p=316
date: '2014-05-04 16:00:51 +0100'
date_gmt: '2014-05-04 08:00:51 +0100'
categories:
- y1275963
tags: []
comments: []
---
<p>Pseudocode :</p>
<pre class="lang:python decode:true">for i = 1 to n-1 do:
     v = a[i]
     j = i - 1
     while j &gt;= 0 and a[j] &gt; v do
          a[j+1] = a[j]
          j = j -1
     a[j+1] = v</pre>
<p>Python Version:</p>
<pre class="lang:python decode:true">__author__ = 'tk'
import random
# def insert_sort(my_str):
#     locf = len(my_str)
#     for j1 in xrange(1,locf,1):
#         ticket = 0
#         temp = my_str[j1]
#         for i1 in xrange(j1-1,0,-1):
#             if i1&gt;=0 and my_str[i1]&lt;my_str[j1]:
#                 ticket  = 1
#                 my_str[i1+1] = my_str[i1]
#             else:
#                 break
#         if ticket == 0:
#             my_str[i1] = temp
#     return my_str
def insert_sort(my_str):
    locf = len(my_str)
    for j1 in xrange(1,locf,1):
        temp = my_str[j1]
        i1 = j1 -1
        while i1&gt;=0 and my_str[i1]&gt;temp:
            my_str[i1+1] = my_str[i1]
            i1 -= 1
        my_str[i1+1] = temp
    return my_str

if __name__ == "__main__":
    tk_list = random.sample(xrange(1000),10)
    print tk_list
    temp_list = tk_list[:]
    print insert_sort(tk_list)
    temp_list.sort()
    print temp_list</pre>
<p>The while loop is the better one. But the for loop is something that I wrote my own. I even asked a <a href="http://stackoverflow.com/questions/23454072/python-for-loop-and-unboundlocalerror">question</a> about the unbounded local variable.</p>
<pre class="lang:python decode:true">def insert_sort(my_str):
    locf = len(my_str)
    for i1 in xrange(1,locf,1):
        temp = my_str[i1]
        tick = 0
        for j1 in xrange(i1-1,-1,-1):
            if j1&gt;=0 and my_str[j1]&gt;temp:
                my_str[j1+1] = my_str[j1]
                tick = 0
            else:
                tick = 1
                break
        if tick == 0:
            my_str[j1] = temp
        if tick == 1:
            my_str[j1+1] = temp
    return my_str</pre>
<p>&nbsp;</p>
