---
layout: post
status: publish
published: true
title: python实现的第一个算法：Linear Regression最小二乘法
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 200
wordpress_url: http://y1275963.info/wordpress/?p=200
date: '2014-03-15 16:58:58 +0000'
date_gmt: '2014-03-15 08:58:58 +0000'
categories:
- Python
tags: []
comments:
- id: 9
  author: 明升M88开户
  author_email: 2291208847@qq.com
  author_url: http://www.xm58tc.com
  date: '2014-03-20 11:59:58 +0000'
  date_gmt: '2014-03-20 03:59:58 +0000'
  content: 加油哦
- id: 10
  author: y1275963
  author_email: 1275963@gmail.com
  author_url: ''
  date: '2014-03-20 17:35:32 +0000'
  date_gmt: '2014-03-20 09:35:32 +0000'
  content: 谢谢啦！
---
<p>这是有关于拟合的一个算法：</p>
<p>http://sagemath.wikispaces.com/numpy.linalg.lstsq</p>
<p><a href="http://y1275963.info/wordpress/wp-content/uploads/2014/03/Screen-Shot-2014-03-15-at-4.46.51-PM.png"><img class="alignnone size-medium wp-image-202" alt="Screen Shot 2014-03-15 at 4.46.51 PM" src="http://y1275963.info/wordpress/wp-content/uploads/2014/03/Screen-Shot-2014-03-15-at-4.46.51-PM-300x161.png" width="300" height="161" /></a></p>
<p>&nbsp;</p>
<p>比如说吧：</p>
<p>x 是原始的x；</p>
<p>y应该是这么写：</p>
<p><span class="lang:matlab decode:true crayon-inline">[y[0],y[1],y[2],y[3],y[4],y[5]; 1,1,1,1,1,1,1]</span></p>
<p><span style="color: #ff3300;">In MatLab we could just write X=A\B.</span></p>
<pre class="lang:matlab decode:true">&lt;&gt;
&gt;&gt; test = x\y

test =

   -0.7977
  210.0485</pre>
<p>而在python里面呢，我们应该这么写：</p>
<p><span style="font-size: 1rem; line-height: 1;"><span class="lang:default decode:true  crayon-inline ">numpy.linalg.lstsq(A,B): </span> </span></p>
<p><span style="font-size: 1rem; line-height: 1;">where array_A is an n*2 array and array_B is a 1*n array.(是有点不一样)</span></p>
<p>&nbsp;</p>
<p><a style="line-height: 1.714285714; font-size: 1rem;" href="http://y1275963.info/wordpress/wp-content/uploads/2014/03/Untitled.png"><img class="alignnone size-medium wp-image-201" alt="Untitled" src="http://y1275963.info/wordpress/wp-content/uploads/2014/03/Untitled-300x225.png" width="300" height="225" /></a></p>
<p><span style="line-height: 1.714285714; font-size: 1rem;">原始数据：</span></p>
<pre class="lang:default decode:true">&lt;&gt;
x_d = [18,23,25,35,65,54,34,56,72,19,23,42,18,39,37]
y_d = [202,186,187,180,156,169,174,172,153,199,193,174,198,183,178]</pre>
<pre class="lang:default decode:true">&lt;&gt;
A=numpy.array([[x_d[j],1] for j in range(15)])
B=numpy.array(y_d)

cd = numpy.linalg.lstsq(A,B)

cd[0]
Out[124]: array([  -0.79772656,  210.04845842])

a=cd[0][0]
b=cd[0][1]</pre>
<p>&nbsp;</p>
<p>绘制部分：</p>
<pre class="lang:default decode:true crayon-selected">&lt;&gt;
import matplotlib.pyplot as plt
x = numpy(x_d)

plt.plot(x,x*a+b)
plt.plot(x_d,B,'o')</pre>
<p>&nbsp;</p>
<p>&nbsp;</p>
