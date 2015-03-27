---
layout: page
status: publish
published: true
title: About This Site
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 91
wordpress_url: http://y1275963.info/?page_id=91
date: '2014-03-02 14:13:58 +0000'
date_gmt: '2014-03-02 06:13:58 +0000'
categories: []
tags: []
comments:
- id: 3
  author: luan
  author_email: luanyifu@163.com
  author_url: ''
  date: '2014-03-16 18:15:16 +0000'
  date_gmt: '2014-03-16 10:15:16 +0000'
  content: 非常艰辛呀
---
<p>额，实在是搞的头都有点大了。。。你说我为了争取网络自由容易嘛。活活搞了一个寒假的有没有，这限制，那限制，送个sql，你说我容易吗。。。。。。。。。。。。。</p>
<p>现在，我们总算可以有了稳定的地方去自由滴发博客了，请允许我扯些废话，告诉大家，这个网站是怎么一点一点的长起来的，额，但是现在看到这个网站，就好像个屠夫一样，我所见者，非http，而是后面一堆一堆的php。额，站长要搞，飞机要搞，核函数也要搞，青春取经路漫漫，而今迈步从头越，从头越！</p>
<ul>
<li>记得是2013年第一场雪的时候吧，栾英杰同学用了一个下午的时间把网站挂到了Mac上的apple server的软件。也许只是一小步，从此不可收拾。。</li>
<li>apple server 太慢，没有phpmyadmin，换，换到mamp上面。本来我是说的不想要牵扯网络的，但是搞数据不得不，我知道，这个窟一打开，就没完了。。</li>
<li>终于，栾英杰于2014年年初的时候正式在宿舍里挂上了网站，兰大宿舍是有静态ip的，通过路由器的重定向功能，我把网路打开了，这时候，网站已经跑到了Ubuntu上面。</li>
<li><span style="line-height: 1.714285714; font-size: 1rem;">某日某时某刻，栾英杰忽然想起来了小时候的一个废弃的二手笔记本，求其父与之，朔日送抵。便于小凤姐姐处以半夜之功搭建，栾英杰的server终于正式上线了。</span></li>
<li><span style="line-height: 1.714285714; font-size: 1rem;">ip链通之后，栾英杰不满足，这时也和郜有了很好的关系，于是注册了人生第一个域名：</span><a style="line-height: 1.714285714; font-size: 1rem;" href="http://gaoshuni.cc">gaoshuni.cc</a><span style="line-height: 1.714285714; font-size: 1rem;">，当时是当做给gao的博客的。</span></li>
<li><span style="line-height: 1.714285714; font-size: 1rem;">好景不长，凤姐姐说难于管理。退之。于是我又放回了宿舍。与凤因为一本书的缘故也莫名其妙地交恶了。</span></li>
<li><span style="line-height: 1.714285714; font-size: 1rem;">这时候宿舍里开始了网禁，那可了不得了，平常电脑我点个浏览器就注册了，黑乎乎的server怎么搞，又是临近期末，于是搁置。</span></li>
<li><span style="line-height: 1.714285714; font-size: 1rem;">放寒假的时候，总算有了时间了。注册阿里云一个，wordpress也从此分家，变成了mac上做本地站，阿里云做总站的格局。</span></li>
<li><span style="line-height: 1.714285714; font-size: 1rem;">发现国内vps需要备案，不厌其烦，花费近两个星期，注册到备案号</span><a style="line-height: 1.714285714; font-size: 1rem;" href="http://y1275963.info/”http://www.miibeian.gov.cn”">鲁ICP备14003846号</a><span style="line-height: 1.714285714; font-size: 1rem;">，其中个就，容看官自斟。注册的时候一直想写个史诗级的记录，就写到这里吧：</span></li>
</ul>
<p><span style="font-size: 1rem; line-height: 1.714285714;"><a href="http://y1275963.info/wordpress/wp-content/uploads/2014/03/333.jpg"><br />
</a><a href="http://y1275963.info/wordpress/wp-content/uploads/2014/03/vm1.png"><img class="aligncenter size-large wp-image-98" alt="vm" src="http://y1275963.info/wordpress/wp-content/uploads/2014/03/vm1-803x1024.png" width="625" height="797" /></a></span></p>
<p><span style="font-size: 1rem; line-height: 1.714285714;">每一行都很要命。。。放到这里我都觉得有点头大。。</span></p>
<ul>
<li>写到今天了，搞了一晚上，打开了ftp的链路，方便同步backup，发现chown的bug一个，然后phpmyadmin那边也已经搞好，方便导入sql。我总结了之前无数建站的失误，实在感觉这个东西和linux，php什么的都有关系，东西大且依赖环境，环境一变，代码统统作废，因此越发的认真地写总结。发现鸟哥上有两句话说的对，建站不是有了网站，给你一下午，保准你能搭起来好多个服务。都是使用的缺省值，根本没有鲁棒性可言。还有一句是，windows上面做不出来你可以去抱怨，linux上的事情做出来了，你应该心存感恩！</li>
</ul>
<p>截止至本文的发文时间，网站那部分已经基本可以使用，backup于本地有备份，使用wordpress的一个plugin叫做：<br />
<a href="http://wordpress.org/support/view/plugin-reviews/backupwordpress">http://wordpress.org/support/view/plugin-reviews/backupwordpress</a> 每天备份一次，之后有时间的了，挂个google driver。wordpress那边已经可用，发推文的时候连发到多处，防止因服务器的问题丢失数据。</p>
<p>3月的更新，如今这个网站的备份已经今非昔比了，它的备份语言已经从口口相传的手工备份，到更高级的网络备份，再到bash shell，再到python。栾英杰基本上是实时地拥有了这个网站。自己感觉wordpress的widget真难用啊。。。</p>
