---
layout: post
status: publish
published: true
title: 'python exercises:'
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 207
wordpress_url: http://y1275963.info/wordpress/?p=207
date: '2014-03-15 18:14:07 +0000'
date_gmt: '2014-03-15 10:14:07 +0000'
categories:
- y1275963
tags: []
comments:
- id: 8
  author: 明升M88开户
  author_email: 2291208847@qq.com
  author_url: http://www.xm58tc.com
  date: '2014-03-19 13:27:49 +0000'
  date_gmt: '2014-03-19 05:27:49 +0000'
  content: 赞
---
<p>python 蒙特卡洛法算pi:</p>
<pre class="lang:python decode:true">import numpy as np
import random

length = 1000000
test=[[random.random(),random.random()] for i in range(length)]
test =np.array(test)
a = test[:,0]
b = test[:,1]
tk2 = np.sqrt(a**2+b**2)
tk=filter(lambda tk2:tk2&lt;1,tk2)
print float(len(tk))/length*4</pre>
<p>3.142124</p>
<p>第二种方法：</p>
<pre class="lang:python decode:true ">import numpy as np

length = 1000000

test = [np.random.random()/(np.cos(np.random.random()*np.pi/2)) for i in range(length)]
tk = filter(lambda x : x&lt;1 ,test)
print float(length)/(len(tk))*2</pre>
<p>3.14452059425</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
