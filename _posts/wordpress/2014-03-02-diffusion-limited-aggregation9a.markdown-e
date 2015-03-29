---
layout: post
status: publish
published: true
title: Diffusion-limited Aggregation（DLA）扩散限制凝聚
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 119
wordpress_url: http://y1275963.info/?p=119
date: '2014-03-02 15:21:45 +0000'
date_gmt: '2014-03-02 07:21:45 +0000'
categories:
- Matlab
tags: []
comments: []
---
<p>大体algorithm：<br />
1. 随机生成一个点<br />
2. 随机另生成一个点<br />
3. 连续地移动新生成的点<br />
4. 直到两个点相邻为止<br />
<a href="http://y1275963.info/wordpress/wp-content/uploads/2014/03/untitled.jpg"><img class="alignnone size-medium wp-image-146" alt="untitled" src="http://y1275963.info/wordpress/wp-content/uploads/2014/03/untitled-300x192.jpg" width="300" height="192" /></a><br />
重复2-4步，就可以生成一棵树了~<br />
generator.m:</p>
<pre class="lang:matlab decode:true ">% function list = generator(list,minrange,maxrange,point)
function list=generator
% clear all;

minrange = -30;
maxrange = 30;

seedx = fix(rand*(maxrange-minrange+1))+minrange;
seedy = fix(rand*(maxrange-minrange+1))+minrange;
seedz = fix(rand*(maxrange-minrange+1))+minrange;
% list =
% point = 10;

% figure;
list=zeros(3000,3);
list(1,:)=[seedx,seedy,seedz];
for i = 2 : 3000
randxtemp = fix(rand*(maxrange-minrange+1))+minrange;
randytemp = fix(rand*(maxrange-minrange+1))+minrange;
randztemp = fix(rand*(maxrange-minrange+1))+minrange;
% hold on
% pback= plot3(list(:,1),list(:,2),list(:,3),'y.');
% pfront = plot3(randxtemp,randytemp,randztemp,'b*');
% axis([-10 10 -10 10 -10 10]);
while scaner(list,randxtemp,randytemp,randztemp)==false
randxtemp = randxtemp + fix(rand*3) - 1;
randytemp = randytemp + fix(rand*3) - 1;
randztemp = randztemp + fix(rand*3) - 1;
% plot3(randxtemp,randytemp,randztemp);
if randxtemp&gt;maxrange
randxtemp = minrange;
end
if randxtemp &lt; minrange
randxtemp = maxrange;
end
if randytemp &gt; maxrange
randytemp = minrange;
end
if randytemp&lt;minrange
randytemp = maxrange;
end
if randztemp &gt; maxrange
randztemp = minrange;
end
if randztemp&lt; minrange
randztemp = maxrange;
end
% set(pfront,'xdata',randxtemp);
% set(pfront,'ydata',randytemp);
% set(pfront,'zdata',randztemp);
% drawnow;
end
list(i,:) = [randxtemp,randytemp,randztemp];
end

scaner.m:
function locked = scaner(a,x,y,z)

[use,less] =size(a);
for i = 1 : use
xtemp = a(i,1);
ytemp = a(i,2);
ztemp = a(i,3);
xlocked = abs(xtemp-x);
ylocked = abs(ytemp-y);
zlocked = abs(ztemp-z);
xlocked = xlocked==1|xlocked==0;
ylocked = ylocked==1|ylocked==0;
zlocked = zlocked==1|zlocked==0;
locked= xlocked&amp;ylocked&amp;zlocked;
if locked ==true
return
end

end</pre>
<p>&nbsp;</p>
