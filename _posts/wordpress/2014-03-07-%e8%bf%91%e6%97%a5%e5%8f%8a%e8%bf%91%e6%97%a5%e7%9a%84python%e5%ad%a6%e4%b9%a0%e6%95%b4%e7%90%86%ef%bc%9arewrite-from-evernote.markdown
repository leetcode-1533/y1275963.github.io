---
layout: post
status: publish
published: true
title: 近日及近日的python学习整理：rewrite from evernote
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 154
wordpress_url: http://y1275963.info/wordpress/?p=154
date: '2014-03-07 23:35:34 +0000'
date_gmt: '2014-03-07 15:35:34 +0000'
categories:
- Python
tags: []
comments: []
---
<p>(1) : 3 ways to create strings: 'Alpha' "Bravo" str(3)</p>
<p>(2) : when you divide an integer by another integer, the result is always an integer(rounded down, if needed)</p>
<p>(3) python's delete :</p>
<p>n.pop(index) ： will remove the item at index from the list and return the removed one to you</p>
<p>n.remove(item) : will remove the actual item if it find it</p>
<p>del(n[1]) is like .pop . it will delete it,but it won't return the removed element</p>
<p>n = [1, 3, 5] ------- &gt; del(n[1])   ------- &gt;   prints [1, 5]</p>
<p>(4)  counting while you do :</p>
<p>choices = ['pizza', 'pasta', 'salad', 'nachos']</p>
<p>print 'Your choices are:'<br />
for index, item in enumerate(choices):<br />
index += 1<br />
print index, item</p>
<p>（5）zip : zip will create pairs of elements when passed two lists, and will stop at the shorted one</p>
<p>(6)  supercall !:</p>
<pre class="lang:python decode:true" title="supercall">class DerivedClass(Base):
  def some_method(self):
      super(DerivedClass, self).meth()</pre>
<p>super 返回继承的母类，需要提供两个参数：</p>
<pre class="lang:python decode:true">class C(B):
    def meth(self, arg):
        super(C, self).meth(arg)</pre>
<p>you should provide :</p>
<p>c: the name of the class; A variable called self.</p>
<p>&nbsp;</p>
<p>(6) list pointer:</p>
<p>list的特性：<br />
由于list的元素可以是任意对象，因此列表中保存的是对象的指针。</p>
<p>2 C like examples:</p>
<pre class="lang:default decode:true ">1:&gt;&gt;&gt; def try_to_change(n):
n = 'Mr. Gumby'

&gt;&gt;&gt; name = 'Mrs. Entity'&gt;&gt;&gt; try_to_change(name)&gt;&gt;&gt; name'Mrs. Entity'</pre>
<p>&nbsp;</p>
<p>2 :</p>
<pre class="lang:default decode:true ">&gt;&gt;&gt; def change(n):
n[0] = 'Mr. Gumby'

&gt;&gt;&gt; names = ['Mrs. Entity', 'Mrs. Thing']&gt;&gt;&gt; change(names)&gt;&gt;&gt; names['Mr. Gumby', 'Mrs. Thing’]</pre>
<p>&nbsp;</p>
<p><span style="line-height: 1.714285714; font-size: 1rem;">The value of variable in the second example has been modified, that because the variable list passed a list of pointers to the function thus the actual variable and the formal variable share the same space in the RAM. what we do change is the pointer/</span></p>
<p><strong> The way to avoid the modification :</strong><br />
using the copying:<br />
the slicing can do it, in the way like:<br />
n = names[:]</p>
