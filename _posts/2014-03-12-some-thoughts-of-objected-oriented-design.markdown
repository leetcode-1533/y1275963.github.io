---
layout: post
status: publish
published: true
title: some thoughts of Objected-Oriented Design
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 185
wordpress_url: http://y1275963.info/wordpress/?p=185
date: '2014-03-12 21:39:07 +0000'
date_gmt: '2014-03-12 13:39:07 +0000'
categories:
- Python
- C++
- Qt
tags: []
comments: []
---
<p>1.Gather what belongs together. If a function manipulates a global variable, the two of them might be better off in a class, as an attribute ands a method.</p>
<p>2. Don't let objects become to intimate. Methods should mainly be concerned with the attribute of their own instance. Let other instances manage their own state.</p>
<p>3. Go easy on the inheritance, especially multiple inheritance. Inheritance is useful at times, but can make things unnecessarily complex in some cases. And multiple inheritance can be very difficult to get right and even harder to debug.</p>
<p>4. Keep it simple. Keep your methods small. As a rule of thumb, it should be possible to read(and understand) most of your methods in, say, 30 seconds. For the rest, try to keep them shorter than one page or screen.</p>
<address>from "Beginning Python From Novice to Professional (Second Edition)" P157</address>
