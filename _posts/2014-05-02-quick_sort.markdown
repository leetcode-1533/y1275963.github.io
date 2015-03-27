---
layout: post
status: publish
published: true
title: 'quick_sort '
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 307
wordpress_url: http://y1275963.info/wordpress/?p=307
date: '2014-05-02 15:31:44 +0100'
date_gmt: '2014-05-02 07:31:44 +0100'
categories:
- Python
tags: []
comments:
- id: 195
  author: 恋字坊
  author_email: 2744957813@qq.com
  author_url: http://cnrdn.com/TNpD
  date: '2014-05-17 21:18:46 +0100'
  date_gmt: '2014-05-17 13:18:46 +0100'
  content: 从松松博客过来的，贵站做的真心不错，我和大学同学也刚做了一个网站，欢迎站长朋友过来看看，能给我提点建议的话就感激不尽了，我的网站是恋字坊http://www.lianzifang.com/
---
<p>This one is not easy.. One issues was generated due to the lists variable in python and its unique characteristic when comes to containing other variable for a mutable one or a immutable one.</p>
<p>I spent days to debug this ugly little bug, and final with the help of the <a href="http://stackoverflow.com/questions/23422135/python-list-and-quick-sort-reference-or-pointer">StackOverFlow</a> I made it. I guess the codes that I wrote a few days age called merge_sort has the seem problem, but at that time I just jump through it.</p>
<p>The partition is the key to merge sort, it is used to generate a partition location for the divide and conquer technique. But the one that I wrote is quite different than what has been presented.</p>
<p><span style="font-size: 1rem; line-height: 1.714285714;">The One that I wrote (I guess the codes are pretty ugly, It is due to I did't catch it on the class... I only remember the format rather than the inner details of it)</span></p>
<pre class="lang:python decode:true">def alpartition(my_str):

    signal = 0
    i = 0
    j = len(my_str)

    while i &lt; j:
            if signal == 0 :
                while 1:
                    j = j - 1
                    if my_str[j] &lt;= my_str[i]:
                        break
                signal = 1
            else:
                while 1:
                    i = i + 1
                    if my_str[j] &lt;= my_str[i]:
                        break
                signal = 0
            # print my_str,i,j
            my_str[j],my_str[i] = my_str[i],my_str[j]
    my_str[j],my_str[i] = my_str[i],my_str[j]
    return i</pre>
<p>&nbsp;</p>
<p>The second version:</p>
<pre>算法 Partition(A[l..r])
//以第一个元素作为中轴，划分数组
//输入：数组A[l..r]，l, r为左右下标
//输出：A[l..r]的一个分区，返回划分点位置
p&lt;-A[l];
i&lt;-l; j&lt;-r+1;
repeat
    repeat i&lt;-i+1 until A[i] ≥p；
    repeat j&lt;-j-1 until A[j] ≤p；
    swap(A[i],A[j]);
until i ≥ j
swap(A[i],A[j]);
swap(A[l],A[j]);
return j;</pre>
<p>&nbsp;</p>
<pre class="lang:python decode:true">def part2(my_str):
    p = my_str[0]

    i = 0
    j = len(my_str)
    while 1:
        while 1:
            i += 1
            if my_str[i]&gt;=p:
                break
        while 1:
            j -= 1
            if my_str[j]&lt;=p:
                break
        my_str[i],my_str[j] = my_str[j],my_str[i]
        if i&gt;=j:
            break
    my_str[i],my_str[j] = my_str[j],my_str[i]
    my_str[0],my_str[j] = my_str[j],my_str[0]
    print my_str
    return j</pre>
<p>&nbsp;</p>
<p>The recursion one:</p>
<pre class="lang:python decode:true">Quicksort(a):
if len(a) &gt;1:
     s = partition(a)
     quicksort(a[l…r-1])
     quicksort(a[r+1…r])</pre>
<p>&nbsp;</p>
<p>The overall code that can work:</p>
<pre class="lang:python decode:true">__author__ = 'tk'
import random
def alpartition(my_str):

    signal = 0
    i = 0
    j = len(my_str)

    while i &lt; j:
            if signal == 0 :
                while 1:
                    j = j - 1
                    if my_str[j] &lt;= my_str[i]:
                        break
                signal = 1
            else:
                while 1:
                    i = i + 1
                    if my_str[j] &lt;= my_str[i]:
                        break
                signal = 0
            # print my_str,i,j
            my_str[j],my_str[i] = my_str[i],my_str[j]
    my_str[j],my_str[i] = my_str[i],my_str[j]
    return i

def test(my_str):
    if len(my_str)&gt;1:
        tick = alpartition(my_str)
        # print my_str,my_str[0:tick:],my_str[tick+1::],tick
        my_str[0:tick:]=test(my_str[0:tick:])
        my_str[tick+1::]=test(my_str[tick+1::])
    return my_str

a = random.sample(xrange(0,100),10)

print a

print test(a)
print sorted(a)</pre>
<p>But anyway it can work..(We can simple change the function from the alpartition to the part2 they are the same in result.)</p>
<p>The Final Version:</p>
<pre class="lang:python decode:true">算法 Partition2(A[l..r])
//以第一个元素作为中轴，划分数组
//输入：数组A[l..r]，l, r为左右下标
//输出：A[l..r]的一个分区，返回划分点位置
p&lt;-A[l];
i&lt;-l-1;  j&lt;-r+1;
while TRUE do
    repeat i&lt;-i+1 until A[i] ≥ p；
    repeat j&lt;-j-1 until A[j] ≤ p；
    if  i&lt;j
         swap(A[i], A[j]);
    else
         return j;</pre>
<p>&nbsp;</p>
<p>The recursion one:</p>
<p class="lang:python decode:true">你好! 这个算法其实是不一定会把A[0]最后放在中间的，这和我们课本上的不一样。你写的代码我看了没错。在执行完后，你检查一下结果，应该是：8 7 [36 43 20 64 48 11 16 44 94 89]。这个结果是正确的，可以看到j=7，A[0..7]都是小于等于A[0]=89，而A[8..9]都是大于等于A[0]的。后面的递归算法和课本也不同，应该分别对A[0..j]和A[j+1..n-1]递归使用partition。你再试试。 路永钢</p>
<p>&nbsp;</p>
<p>please note that the main function also has changed</p>
<pre class="lang:python decode:true">import random

def part(my_str):
    p = my_str[0]
    i = -1
    j = len(my_str)
    while 1:
        while 1:
            i = i + 1
            if my_str[i]&gt;=p:
                break
        while 1:
            j = j-1
            # print j
            if my_str[j]&lt;=p:
                break
        if i&lt;j:
            print i,j,my_str
            my_str[i],my_str[j] = my_str[j] ,my_str[i]
        else:
            return j

def test(my_str):
    if len(my_str)&gt;1:
        tick = part(my_str)
        # print my_str,my_str[0:tick:],my_str[tick+1::],tick
        my_str[0:tick+1:]=test(my_str[0:tick+1:])
        my_str[tick+1::]=test(my_str[tick+1::])
    return my_str

a = random.sample(xrange(0,100),10)
print a
b = a[:]
test(a)
print a
b.sort()
print b</pre>
<p>&nbsp;</p>
<p>:)</p>
