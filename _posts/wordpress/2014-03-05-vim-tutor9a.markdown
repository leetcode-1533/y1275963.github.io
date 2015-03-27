---
layout: post
status: publish
published: true
title: vim tutor：
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 148
wordpress_url: http://y1275963.info/wordpress/?p=148
date: '2014-03-05 19:56:45 +0000'
date_gmt: '2014-03-05 11:56:45 +0000'
categories:
- Vim
tags: []
comments: []
---
<p>本文引自Evernote：</p>
<p><span style="text-decoration: underline;">motion</span> :<br />
w  To move in the distance of the word(To the start of the next word)<br />
e  to move in the distance of the word( To the end of the current word)<br />
$ to move in the direction of the Line.(move to the end of the line)<br />
0 to the start of this line ;</p>
<p>gg : to the start of the file<br />
G to the bottom of the file</p>
<p>A to the end of the line, and this will put in you into input mode.<br />
a to the end of the cursor and this will put you into input mode.<br />
open up a new line <span style="text-decoration: underline;">and get into the input method</span>: O upper line<br />
o lower line<br />
page down control d<br />
page up     control u<br />
using a count for the motion : e.g. 2w; 3e;         {<span style="text-decoration: underline;">operator</span> [number]motion}<br />
<span style="text-decoration: underline;">replace mode  &amp; change </span><br />
R get into the replace mode<br />
r get into the replace mode for only one letter.<br />
C to change eg : to change a word : ce<br />
<span style="text-decoration: underline;">copy and paste and cut </span><br />
to paste : use the word p (put)</p>
<p>to visual select :   v</p>
<p>to yank( copy) : y<br />
to cut : using delete.<br />
<span style="text-decoration: underline;">vim Find and replace</span></p>
<p>/ search the whole world</p>
<p>n : keep on searching<br />
N: search the word in an opposite direction<br />
TO GO Back<br />
ctrl + o move back<br />
ctrl + i move forward( move in the direction set by wether N or n)</p>
<p>? search for the phrase</p>
<p>% Match for the [ { ( etc.</p>
<p>To replace<br />
eg:<br />
s/old/new/g globally replace (s stands for substitute)<br />
s/old/new : only replace the first found one<br />
%s/old/new/g : to change every occurrence in the whole file<br />
%s/old/new/gc : to change with a prompt<br />
#,#s/old/new/g e.g. like 11,14s/old/new/g : to change between the line 11 and 14</p>
<p>retrieve<br />
r + [filename] : to retrieve the file below the cursor<br />
or retrieve from the external command like  r !ls</p>
