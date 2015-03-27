---
layout: post
status: publish
published: true
title: Brute Force String Match
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 471
wordpress_url: http://y1275963.info/wordpress/?p=471
date: '2014-11-30 06:29:25 +0000'
date_gmt: '2014-11-29 22:29:25 +0000'
categories:
- Python
tags: []
comments: []
---
<p>This is a Brute Force String Match Algorithm.</p>
<div class="crayon-line"><span class="crayon-s"> It will match the string character by character until matched</span></div>
<pre class="lang:python decode:true"># -*- coding: utf-8 -*-
"""
Created on Sat Nov 29 22:06:06 2014

@author: y1275963
"""

def BruteForceStringMatch(Text, Pattern):
    """ 
    This is a Brute Force String Match Algorithm.
    It will match the string character by character until matched
    
    Input:
    Text : The search area.
    Pattern: The candidate to do the search
    
    output : 
    The index of the first character in the text that starts 
    the matching pattern.
    
    If failed, -1 is returned.
    
    By the way, this is only for the education purpose. 
    Python's "=" operator is capable of doing string match directly.
    """
    for i in xrange(0,len(Text)-len(Pattern)+1):
    # +1 because xrange(0,1) is 1 , But we want it to include i at 
    # len(Text)-len(Pattern)
        
        j = 0
        while j &lt; len(Pattern) and Pattern[j] == Text[i+j]:
            j = j + 1
        if j == len(Pattern):
            return i
            
    return -1
        
    

if __name__ is "__main__":
    
    text = "This is a test"
    Pattern = "st"
    
    print BruteForceStringMatch(text,Pattern)</pre>
<p>&nbsp;</p>
