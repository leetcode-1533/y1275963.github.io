---
layout: page
status: publish
published: true
title: Math_Radio
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 326
wordpress_url: http://y1275963.info/wordpress/?page_id=326
date: '2014-05-08 09:59:21 +0100'
date_gmt: '2014-05-08 01:59:21 +0100'
categories: []
tags: []
comments: []
---
<p>说明下，<br />
某年月日我去了次招聘会，感觉挺受打击的，感觉自己对本专业的东西掌握的太水了，想去蹭计算机的，但是基础又不如人家好。思来想去，老本行还是不能丢，于是吧，想去做个硬件项目，软件天生比较好，就做个收音机吧。</p>
<p><a href="http://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2014/05/20140518-202632-73592740.jpg"><img src="http://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2014/05/20140518-202632-73592740.jpg" alt="20140518-202632-73592740.jpg" class="alignnone size-full" /></a></p>
<p>数字式的收音机，纯粹靠算法解调。本来是因为没有设备要自己学51单片机慢慢弄得，某天突然得到了一个sdr的设备，重新点燃了希望呀。已经是可以接受FM的频率了。</p>
<p>给梅老师说了一下，他挺支持的，让我去找靳老师，但是实验室里没有RF设备。我感觉我对信号的理解有更深了一层了，所谓调制解调都是为了传输方便定义的。我自然是可以把该方法用在本来就能稳定传输的地方上去。。所以吧，我打算直接拿可以编程的信号源（实在话，耳机就是，但是频率太低了），结合一个示波器。把我已经做在matlab里面的数据放到外面去跑一圈，感觉理论上没啥难度，就是缺设备。等等上资料吧。</p>
<p>到5月17号的进度呢：<br />
1.matlab上面am的仿真弄了。fm还没有学<br />
2.sdr的接收器弄好了，就是没有信号源不好调试。<br />
3.matlab上面的离散傅利叶分析也弄好了，但是感觉每秒几百万个点，数据量有点大。<br />
4.由于是IQ信号，我是问了万老师才知道那个东东是做什么的</p>
<p>最近，就差找到一个可以任意编程的信号发生器了，我一旦可以让它按照我给定的采样率，幅值工作，剩下的就好办了。因为示波器上我已经知道可以用了。到时候调制的时候，我先把am调制好的信号发过去，再用示波器收回来，再解调一下。。</p>
<p>:)没问题，弄好了上资料哈</p>
