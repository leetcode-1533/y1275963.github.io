---
layout: post
status: publish
published: true
title: Linux Compression
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 113
wordpress_url: http://y1275963.info/?p=113
date: '2014-03-02 15:00:34 +0000'
date_gmt: '2014-03-02 07:00:34 +0000'
categories:
- Linux
tags: []
comments:
- id: 28
  author: gta 5 cheats
  author_email: alex_mmymjupry@gmail.com
  author_url: http://gta5cheats
  date: '2014-04-07 16:08:01 +0100'
  date_gmt: '2014-04-07 08:08:01 +0100'
  content: 'Definitely would love to start a website like yours. Wish I had the time.
    My site is so amateurish compared to yours, feel free to check it out: http://tinyurl.com/o55af8p
    Alex :)'
---
<p>gzip <span style="text-decoration: underline;">(z)</span><br />
-c : transfer to the screen, can be redirected<br />
-d : extract<br />
-t : to check the consistent</p>
<p>eg:<br />
gzip passwd</p>
<p>check:<br />
zcat.</p>
<p>extract:<br />
gzip -d <br />
gunzip </p>
<p>gzip -1 -c passwd &gt; passwd.gz : redirection</p>
<p>bzip2<span style="text-decoration: underline;">:(j)</span><br />
-z compress<br />
-c<br />
-d</p>
<p>extract<br />
bzip2 -d<br />
bunzip2</p>
<p>compress<br />
bzip2 <br />
bzip2 -z( It is the same)</p>
<p>tar<br />
cvf : pick without compress (c :create, v visual, to show something, f using the filename)<br />
x : extract<br />
-t check the tar file<br />
--exclude : exclude</p>
<p>eg:<br />
tar -cvf test.tar test</p>
<p>gzip compression:</p>
<p>tar -zcvf </p>
<p>bzip2 compression</p>
<p>tar -jcvf </p>
<p>checking file</p>
<p>tar -tvf filename</p>
<p>extracting file</p>
<p>tar -xvf filename</p>
<p>exclude:<br />
eg: tar --exclude test -jcvf created-file-name source-file-name</p>
<p>zip</p>
<p><span style="font-size: 13pt;">-A auto extracting<br />
-d delete<br />
-r all （recursion)<br />
-z add reference</p>
<p>zip -r test.zip test<br />
zip test.zip -m test.tar.bz2 (including one)<br />
zip -z test.zip (adding reference)<br />
     checking reference:<br />
               unzip -z test.zip; or zipinfo</p>
<p>zipinfo<br />
</span>     -l only list the file name<br />
     -h compressed file name       <br />
     -m like in a way like MORE<br />
     -z showing the reference<br />
     -t only list the number of it<br />
<span style="text-decoration: underline;">unzip</span></p>
<p>    -t checking the consistence<br />
     -v showing the specific information (NOT extracting)<br />
     -z showing the reference<br />
     -l showing the file<br />
     -M showing in a way like MORE<br />
     -p to give the password of it</p>
