---
layout: post
status: publish
published: true
title: 论windows与Linux
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 129
wordpress_url: http://y1275963.info/www/?p=129
date: '2014-03-02 22:57:04 +0000'
date_gmt: '2014-03-02 14:57:04 +0000'
categories:
- y1275963
tags: []
comments: []
---
<p>今天有个同学找我装黑Mac，没给他弄。他说Win不好，我就胡乱瞎想，今天正好就用上了linux下面的apache的备份。有点感觉，写写吧。</p>
<h2>Linux哲学：</h2>
<p>一切皆文件。操作系统是这样工作的：</p>
<p>首先，一个用户，也就是个人拉，发起了一个相应，linux去反查用户的gid，uid等信息，然后传给一个叫进程的东西。进程就好像拿了一个rwx之类的string。通过一个叫作vfs的映射机制，按照一切皆文件的思想，将进程的操作映射为对文件的操作，访问了资源，操作完成。</p>
<p>可以看见，linux一切一切都是文件，甚至连用户的权限也可以用一个文件来表示。</p>
<h2>Windows哲学：</h2>
<p>一切皆对象，我不明白是怎么操的：</p>
<p>按照http://blog.csdn.net/dog250/article/details/5303613的说法，windows访问个东西那是相当的麻烦，就好像c-&gt;c++的区别，什么都有了属性。之前linux下面给用户一个sid的小字，只是和用户名这个<span style="text-decoration: underline;"><strong><span style="text-decoration: underline;">文件</span></strong></span>挂钩，但到了win下面，太麻烦了，什么随机生成，什么随机数，什么结构体。就好比linux上是一行，这边就要一本书那么多了。进程也变了，还有啊，用户名也不是一切了，因为文件在这里并不能决定一切，今天注册一个b和明天同样注册一个b他们在下派进程的时候所使用的那个叫权限的令牌是不一样的。</p>
<p>这个blog有个比喻，说这个操作系统好比一把尺，一边是用户，一边是系统。windows站在了用户那边，linux站在了系统那边。于是乎，windows上面就有了注册表之类的统一管理的东西。因为windows上面用户之间是严格区分的，导致他本身实现多用户也越发困难了。但是linux就不一样，他站在系统那边，好比我今天那个网站，我的想法就是复制，替换。但到了windows就不一样了，他给你打时间戳，今天的，明天的都不一样。</p>
<p>windows用起来舒服是毋庸置疑的，用户看到的win都替你包装好了，你看到的就是一个口，用去吧。linux恶心，但是程序员在里面真心舒服呀，想我，重装系统就是复制/etc /home文件，也不用去万恶的注册表里注册。</p>
<p>应该是不同的应用面对不同的哲学吧，windows面对的是具体，细分到极点看电影，打游戏的应用，谁也不想为了删个软件给你一个3000页的手册。统一集中的管理。</p>
<p>unix，linux是程序员的好朋友，比如你写个程序，不用去注册，给它个权限就能用。但到了用户。我曾经为了删linux下面一个游戏把整个系统删掉了你明白吗？</p>
<p>还有啊，写这么多啰啰嗦嗦的，是想说直到此时此刻，我才知道之前我一直是带着Win的思想去操作的，unix下面一切都是文件，注册个用户同名就是同一个，毋庸置疑！之后大胆地复制吧，文件一样就一样！</p>
<h2></h2>
