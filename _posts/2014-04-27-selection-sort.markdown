---
layout: post
status: publish
published: true
title: Selection Sort
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 292
wordpress_url: http://y1275963.info/wordpress/?p=292
date: '2014-04-27 16:12:14 +0100'
date_gmt: '2014-04-27 08:12:14 +0100'
categories:
- Python
tags: []
comments: []
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--> for i =2 to n-2 do</p>
<div>     min_loc = i</div>
<div>     for j = i +1 to n-1 do</div>
<div>          if a[j]&lt;a[min]</div>
<div>               min_loc = j</div>
<div>     swap a[j] and a[min]</div>
<div></div>
<div>
<hr />
</div>
<div>
<pre class="lang:python decode:true ">import random

def sort_selection(my_list):
    for i1 in xrange(0,len(my_list)-1,1):
        min_loc = i1
        for j1 in xrange(i1+1,len(my_list),1):
            if my_list[j1] &lt; my_list[min_loc]:
                min_loc = j1
        my_list[i1],my_list[min_loc] = my_list[min_loc],my_list[i1]
    return my_list

if __name__ == "__main__":
    tk_list = random.sample(xrange(1000),10)
    print "my_list" + str(tk_list)
    print sort_selection(tk_list)
    print sorted(tk_list)</pre>
<p>&nbsp;</p>
</div>
