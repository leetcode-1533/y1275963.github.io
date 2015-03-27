---
layout: post
status: publish
published: true
title: 'wordpress 建站 part2 : phpmyadmin配置'
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 67
wordpress_url: http://y1275963.info/?p=67
date: '2014-03-02 09:43:37 +0000'
date_gmt: '2014-03-02 01:43:37 +0000'
categories:
- Linux
tags: []
comments: []
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?-->1. 接入 centos_forge :</p>
<div>yum install <a href="http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm">http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm</a></div>
<div>2. 安装：</div>
<div><span style="text-decoration: underline;">yum install phpmyadmin</span></div>
<div>3.</div>
<div><span style="text-decoration: underline;">加注释，更改 apache 配置：</span></div>
<div>
<div>现在，我们配置phpMyAdmin。改变Apache的配置，使phpMyAdmin连接，而不仅仅是从localhost(注释掉允许) ：</div>
<ol>
<li>vi /etc/httpd/conf.d/phpmyadmin.conf</li>
<li>#</li>
<li># Web application to manage MySQL</li>
<li>#</li>
<li>#</li>
<li># Order Deny,Allow</li>
<li># Deny from all</li>
<li># Allow from 127.0.0.1</li>
<li>#</li>
<li>Alias /phpmyadmin /usr/share/phpmyadmin</li>
<li>Alias /phpMyAdmin /usr/share/phpmyadmin</li>
<li>Alias /mysqladmin /usr/share/phpmyadmin</li>
</ol>
<div>4.</div>
<div><span style="text-decoration: underline;">将Cookie 改为 http</span></div>
<div>下一步，我们改变在phpMyAdmin的身份验证cookie ，HTTP：</div>
<ol>
<li>vi /usr/share/phpmyadmin/config.inc.php[...]</li>
<li>/* Authentication type */</li>
<li>$cfg['Servers'][$i]['auth_type'] = ‘http’;</li>
<li>[…]</li>
</ol>
<div>5.</div>
<div>/etc/init.d/httpd restart</div>
</div>
