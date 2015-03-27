---
layout: post
status: publish
published: true
title: 'Wordpress 建站 PART1: 综合建站(centos)'
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 62
wordpress_url: http://y1275963.info/?p=62
date: '2014-03-02 09:41:23 +0000'
date_gmt: '2014-03-02 01:41:23 +0000'
categories:
- Linux
tags: []
comments: []
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?-->开始把业务转移到 centos 上面，这样可以和red hat接轨。。</p>
<div>总结一下：</div>
<div>dnspod的dns服务</div>
<div>godaddy的域名</div>
<div>阿里云的服务器。</div>
<div>好东西我都占齐了~</p>
<div>记录下怎么搭建wordpress的吧：</div>
<div><b>1.</b></div>
<div>We can download Wordpress straight from their website:</div>
<div><span style="text-decoration: underline;">wget http://wordpress.org/latest.tar.gz</span></div>
<div>unzip :</div>
<div><span style="text-decoration: underline;">tar -xzvf latest.tar.gz </span></div>
<div>copying it:</div>
<div><span style="text-decoration: underline;">mkdir /var/www/html/wordpress</span></div>
<div><span style="text-decoration: underline;">cp -R ~/wordpress /var/www/html/wordpress</span></div>
<div>grant privilege:</div>
<div><span style="text-decoration: underline;">chown -R apache /var/www/html/wordpress<br />
</span></p>
<hr />
</div>
<div><b>2. </b></div>
<div><b>mysql </b>:</div>
<div>1.卸载掉原有mysql</div>
<div><span style="text-decoration: underline;">rpm -qa | grep mysql</span>  // 这个命令就会查看该操作系统上是否已经安装了mysql数据库</div>
<div><span style="text-decoration: underline;">rpm -e mysql</span>  // 普通删除模式</div>
<div><span style="text-decoration: underline;">rpm -e --nodeps mysql </span> // 强力删除模式，如果使用上面命令删除时，提示有依赖的其它            文件，则用该命令可以对其进行强力删除  <strong><br />
</strong></div>
<div>2.install mysql:</div>
<div><span style="text-decoration: underline;">yum install -y mysql-server mysql mysql-devel</span></div>
<div>3.启动</div>
<div> <span style="text-decoration: underline;">service mysqld start</span></div>
<div>3.设置开机启动：</div>
<div>设置开机启动：</div>
<div> <span style="text-decoration: underline;">chkconfig mysqld on</span></p>
<div><span style="text-decoration: underline;">检查一下：</span></div>
<div><span style="text-decoration: underline;"> <span style="text-decoration: underline;">chkconfig --list | grep mysqld </span></span></div>
</div>
<div>4.设置密码：</div>
<div><span style="text-decoration: underline;">/usr/bin/mysqladmin -u root password 'new-password' </span> // 为root账号设置密码</div>
<div>5.登陆</div>
<div><span style="text-decoration: underline;">mysql -u root -p</span></div>
<div><span style="text-decoration: underline;"> </span></div>
<div>6.wordpress part</div>
<div></div>
<div><span style="text-decoration: underline;">just copy it :~</span></div>
<div><span style="text-decoration: underline;">1.CREATE DATABASE wordpress;  </span></div>
<div>2.CREATE USER wordpressuser@localhost;</div>
<div>3.SET PASSWORD FOR wordpressuser@localhost= PASSWORD("password");</div>
<div><span style="text-decoration: underline;">4.GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'password';</span></div>
<div><span style="text-decoration: underline;">5.FLUSH PRIVILEGES;</span></div>
<div><span style="text-decoration: underline;">6.exit</span></div>
<div>
<hr />
<p><b>3.</b></div>
<div>install <b>Apache</b>:</div>
<div><span style="text-decoration: underline;">yum –y install httpd</span></div>
<div><span style="text-decoration: underline;">chkconfig --levels 235 httpd on</span></div>
<div><span style="text-decoration: underline;">/etc/init.d/httpd start</span></div>
<div>
<hr />
<p><b>4.Php</b></div>
<div><span style="text-decoration: underline;">yum –y install php</span></div>
<div><span style="text-decoration: underline;"> </span></div>
<div><span style="text-decoration: underline;">/etc/init.d/httpd restart</span></div>
<div></div>
<div><span style="text-decoration: underline;">yum –y install php-mysql php-common php-mbstring php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc   </span></div>
<div></div>
<div><span style="text-decoration: underline;">/etc/init.d/httpd restart </span></div>
<div><span style="text-decoration: underline;"> </span></div>
<div>
<hr />
<div>
<div>5.</div>
<div>设置dns解析。</div>
<div>请注意，域名提供商不代表dns解析提供商。谁家的dns就找谁去解析。</div>
<div>我用的dnspod</div>
<div>@</div>
<div><img alt="" src="file:///Users/tk/Library/Containers/com.evernote.Evernote/Data/Library/Application%20Support/Evernote/accounts/Evernote/y1275963/content/p1690/0b5ffcc0b9176d44ca396135c3322ddf.png" /></div>
<div>
<hr />
</div>
<div>6</div>
<div>设置</div>
<div>own directory：</div>
<ol>
<li>Create the new location for the core WordPress files to be stored (we will use /wordpress in our examples). (On linux, use mkdir wordpress from your www directory. You'll probably want to use "chown apache:apache" on the wordpress directory you created.)</li>
<li>Go to the <a href="http://codex.wordpress.org/Administration_Panels#Settings">General</a> panel.</li>
<li>In the box for <strong>WordPress address (URL):</strong> change the address to the new location of your main WordPress core files. Example:<a href="http://example.com/wordpress">http://example.com/wordpress</a></li>
<li>In the box for <strong>Site address (URL):</strong> change the address to the root directory's URL. Example: <a href="http://example.com/">http://example.com</a></li>
<li>Click <strong>Save Changes</strong>. (Do not worry about the error message and do not try to see your blog at this point! You will probably get a message about file not found.)</li>
<li>Move your WordPress core files to the new location (WordPress address).</li>
<li>Copy (NOT MOVE!) the index.php and .htaccess files from the WordPress directory into the root directory of your site (Blog address). The .htaccess file is invisible, so you may have to set your FTP client to <a href="http://codex.wordpress.org/Changing_File_Permissions#Unhide_the_hidden_files">show hidden files</a>. If you are not using <a href="http://codex.wordpress.org/Using_Permalinks#Using_.22Pretty.22_permalinks">pretty permalinks</a>, then you may not have a .htaccess file. <em><strong>If you are running WordPress on a Windows (IIS) server</strong></em><em> and are using pretty permalinks, you'll have a </em><em>web.config</em><em> rather than a </em><em>.htaccess</em><em> file in your WordPress directory. For the </em><em>index.php</em><em> file the instructions remain the same, copy (don't move) the index.php file to your root directory. The web.config file, must be treated differently then the .htaccess file so you must MOVE (DON'T COPY) the </em><em>web.config</em><em> file to your root directory.</em></li>
<li>Open your root directory's index.php file in a <a href="http://codex.wordpress.org/Glossary#Text_editor">text editor</a></li>
<li>Change the following and save the file. Change the line that says:<br />
require( dirname( __FILE__ ) . '/wp-blog-header.php' );<br />
to the following, using your directory name for the WordPress core files:<br />
require( dirname( __FILE__ ) . '/wordpress/wp-blog-header.php' );</li>
</ol>
<ol>
<li>Login to the new location. It might now be <a href="http://example.com/wordpress/wp-admin/">http://example.com/wordpress/wp-admin/</a></li>
<li>If you have set up <a href="http://codex.wordpress.org/Using_Permalinks">Permalinks</a>, go to the <a href="http://codex.wordpress.org/Administration_Panels#Permalinks">Permalinks panel</a> and update your Permalink structure. WordPress will automatically update your .htaccess file if it has the appropriate file permissions. If WordPress can't write to your .htaccess file, it will display the new rewrite rules to you, which you should manually copy into your .htaccess file (in the same directory as the mainindex.php file.)</li>
</ol>
<div></div>
</div>
</div>
</div>
