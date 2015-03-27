---
layout: post
status: publish
published: true
title: 'wordpress 建站part 3 : vsftpd技术'
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 64
wordpress_url: http://y1275963.info/?p=64
date: '2014-03-02 09:42:02 +0000'
date_gmt: '2014-03-02 01:42:02 +0000'
categories:
- Linux
tags: []
comments: []
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--> 主要文献：</p>
<div>
<div><a href="http://www.centos.bz/2011/03/centos-install-vsftpd-ftp-server/">http://www.centos.bz/2011/03/centos-install-vsftpd-ftp-server/</a>:</div>
<div><strong>centos 5 yum安装与配置vsFTPd FTP服务器</strong></div>
</div>
<div>阿里云采用云盾防火墙，无需设置iptables</div>
<div></div>
<div>1. yum install vsftpd</div>
<div>2. chkconfig vsftpd on</div>
<div>3. /etc/init.d/vsftpd start</div>
<div>     as a rest of this :</div>
<div>          \service vsftpd start</div>
<div>          \ service vsftpd stop</div>
<div>          \ service vsftpd restart</div>
<div>4. 直接跳过防火墙部分，配置vsftpd服务器：</div>
<div>将 将底下三行</div>
<ol>
<li>#chroot_list_enable=YES</li>
<li># (default follows)</li>
<li>#chroot_list_file=/etc/vsftpd.chroot_list</li>
</ol>
<div>改为</div>
<ol>
<li>chroot_list_enable=YES</li>
<li># (default follows)</li>
<li>chroot_list_file=/etc/vsftpd/chroot_list</li>
</ol>
<div>5. 添加用户：ftpuser is the ftp user name</div>
<div>(1)useradd -d <span style="text-decoration: underline;">/home/wwwroot/ftpuser</span> -g ftp -s /sbin/nologin ftpuser</div>
<div>     将划线部分改为 /var/www/html/wordpress</div>
<div>(2)设置密码：</div>
<div>     passwd ftpuser</div>
<div>(3) chown ftpuser -R /var/www/html/wordpress</div>
<div></div>
<div>6. 创建chroot_list表（需新建）：</div>
<div>     vim /etc/vsftpd/chroot_list</div>
<div>一行一个用户名：</div>
<div>
<div>内容为ftp用户名,每个用户占一行,如：</div>
<div></div>
<div>peter</div>
<div>john</div>
</div>
<div></div>
<div>7.service vsftpd restart</div>
<div></div>
<div>待测试：<a href="http://wiki.centos.org/HowTos/Chroot_Vsftpd_with_non-system_users">http://wiki.centos.org/HowTos/Chroot_Vsftpd_with_non-system_users</a>：</div>
<div>官方脚本</div>
<p>&nbsp;</p>
