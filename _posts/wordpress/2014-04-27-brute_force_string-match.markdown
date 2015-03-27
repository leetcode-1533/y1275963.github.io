---
layout: post
status: publish
published: true
title: brute_force_string match
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 295
wordpress_url: http://y1275963.info/wordpress/?p=295
date: '2014-04-27 16:34:00 +0100'
date_gmt: '2014-04-27 08:34:00 +0100'
categories:
- y1275963
tags: []
comments: []
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--></p>
<div>
for i = 0 to n - m do:</div>
<div>     j = 0</div>
<div>     while j&lt;m and p[j] = t[i+j] do:</div>
<div>          j = j+1</div>
<div>     if j = m</div>
<div>          return i</div>
<div>else</div>
<div>     return -1</div>
<div></div>
<div>
<hr />
</div>
<div>
<pre class="lang:python decode:true ">def bruteforcestringmatch(my_str,wan_str):
    wlen = len(wan_str)
    for i in xrange(0,len(my_str)-wlen,1):
        j = 0
        while j &lt; wlen and wan_str[j] == my_str[i+j]:
            j = j+1
        if j == wlen:
            return i
    else:
        return -1

if __name__ == "__main__":
    test_str = "41kga34s3"
    want_str = "34s"
    print bruteforcestringmatch(test_str,want_str)</pre>
<p>&nbsp;</p>
</div>
<div><b><i><span style="text-decoration: underline;">The for’s else statement:</span></i></b></div>
<div><b><i><span style="text-decoration: underline;"> </span></i></b></div>
<div>
<div>In a construct like this one:</div>
<div></div>
<div>for i in foo:<br />
if bar(i):<br />
break<br />
else:<br />
baz()</div>
<div></div>
<div>the else suite is executed after the for,<span style="text-decoration: underline;"> but only if the for terminates <b>normally </b></span>(not by a break).</div>
<div></div>
<div></div>
<div>
<div><b><span style="text-decoration: underline;"><i>generate a random string:</i></span></b></div>
<div>
<hr />
</div>
<div>import random</div>
<div>import string</div>
<div></div>
<div>N=6</div>
<div>print ''.join(random.choice(string.ascii_uppercase + string.digits) for i in range(N))</div>
<div>
<hr />
</div>
<div>The sample:</div>
<div>3OZ8BP</div>
</div>
</div>
