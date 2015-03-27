---
layout: post
status: publish
published: true
title: sequentialSearch
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 467
wordpress_url: http://y1275963.info/wordpress/?p=467
date: '2014-11-30 06:00:37 +0000'
date_gmt: '2014-11-29 22:00:37 +0000'
categories:
- Python
tags: []
comments: []
---
<p>The algorithm simply compares successive elements of a given list with a given search key untile either a match is encounterd (successful search) or the list is exhausted without finding a match( unsuccessful search).</p>
<pre class="lang:python decode:true" title="sequentialSearch"># -*- coding: utf-8 -*-
"""
Created on Sat Nov 29 21:34:58 2014

@author: y1275963
"""

def sequentialSearch(Test_String,can_String):
    """
    This is a simple sequentialSeach function.
    
    The algorithm simply compares successive elements of a given list
    with a given search key untile either a match is 
    encounterd (successful search) or the list is exhausted 
    without finding a match( unsuccessful search). 
    
    By default, only the first match location is printed out.
    
    If failed, -1 is returned.
    
    Example:
   
    Test_String = "The test is" : Area of doing search
    can_String = "is" : Candidate string for match
    print sequentialSearch(Test_String,can_String)
    
    The output is "9"
    
    """
    length_Test = len(Test_String)
    length_can = len(can_String)
    i = 0

    while Test_String[i:i+length_can] != can_String:
        i = i + 1
        if i&gt; (length_Test-length_can): # Break before to the end  &gt; not &gt;=
            break
    if i &lt; length_Test:
        return i
    else:
        return -1
        
    

if __name__ == "__main__":
    Test_String = "The test is" #Area of doing search
    can_String = "is" # Candidate string for match
    
    print sequentialSearch(Test_String,can_String)


    
</pre>
<p>&nbsp;</p>
