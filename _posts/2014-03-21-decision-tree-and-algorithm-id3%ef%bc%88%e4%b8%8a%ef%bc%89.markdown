---
layout: post
status: publish
published: true
title: Decision Tree and Algorithm ID3（上）
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 237
wordpress_url: http://y1275963.info/wordpress/?p=237
date: '2014-03-21 21:52:50 +0000'
date_gmt: '2014-03-21 13:52:50 +0000'
categories:
- Python
tags: []
comments: []
---
<p>额，还是老外实在呀。我就全文翻译了ID3算法，然后再附带上python代码：</p>
<p>Main Bibliography: <a href="http://www.cise.ufl.edu/~ddd/cap6635/Fall-97/Short-papers/2.htm" target="_blank">The ID3 Algorithm</a></p>
<p>做完后，您将得到这样一张表，来构建一个专家系统分类信息：<img alt="" src="http://www.cise.ufl.edu/~ddd/cap6635/Fall-97/Short-papers/Image3.gif" width="640" height="306" /></p>
<p>Id3算法基于 Claude Shannon的信息论。在那里面，我们从信息的本质出发，定义了一个叫<span style="text-decoration: underline;">entropy</span>的东东，还有一个叫做<span style="text-decoration: underline;">information</span>的。我们将从那个平面去评价分类之后的信息增益(<span style="text-decoration: underline;">Information Gain</span>)，然后构建从最有利于增加信息增益的角度去构建决策树。</p>
<p style="padding-left: 30px;">处理数据的类型：（Data Description）：(致读者：看是看不懂的，建议你抄一遍，我就这么做的）</p>
<ul>
<li>Attribute-value description_ The same attributes must describe each example and have a fixed number</li>
<li>predefined classes: an examples's attributes must already be defined. That is, they are not learned by ID3</li>
<li>Discrete classes: classes must be sharply delineated. Continuous classes broken up in range categories, such as a metal being, "hard","quite hard","flexible","soft"are suspected.</li>
<li>Sufficient Example.</li>
</ul>
<p>我不扯理论啦。直接上示例，您要是拿着笔跟老栾算上半小时，保证您能理解：</p>
<p>1. 计算 Entropy。 假设我们的集合有14个样本，其中，9个是Yes，5个是NO，那么，Entropy is :</p>
<p>Entropy(S) = - (9/14) Log2 (9/14) - (5/14) Log2 (5/14) = 0.940</p>
<p>公式表达：Entropy(S) = sum（ -p(I) log2 p(I)）：</p>
<ul>
<li>p(i) proportion of S belonging to class I.(在这里面，比如：p(yes)=9/14,p(no)=5/15</li>
<li>注意哦，我们现在计算的Entropy：Not an attribute but the entire sample set.(别和下面的弄混喽）</li>
</ul>
<p>2.计算分类后的信息增益，我们希望我们的分类能够带来最大的信息增益：</p>
<p>假设我们的集合有14个样本，每个样本有若干属性，其中一个叫做wind。对于数据集呢9个是yes，5个是no。而对于wind属性呢，每个样本上也有这个attribute，8个是叫做 strong wind，其中这8个有6个属于yes，2个no。6个是叫做weak wind，3个属于yes，3个属于no。</p>
<p>（请读者注意我的语法，我在尽全力去区分yes/no属性和wind的Strong/weak属性，这个根本是两码事，我们希望通过知道了wind等一系列attribute后来帮助我们决策是yes Or no。虽然他们很相像，但您千万别弄混了。）</p>
<p>我们计算一下gain(s,wind):</p>
<p>gain(s,a) = Entropy(S) - (8/14)*Entropy(a(weak) - (6/14)*Entropy(a(strong))</p>
<p>其中:</p>
<ul>
<li>Entropy(S):- (9/14) Log2 (9/14) - (5/14) Log2 (5/14) = 0.940(1)中计算掉了）</li>
<li>Entropy(a(weak)): <tt>-</tt> (6/8)*log2(6/8) - (2/8)*log2(2/8) = 0.811(我们把weak当作全集重新为S）计算Entropy;为了再次引起您的注意，我再把数据附带上，您就明白了：8个weak中6个是属于Yes，2个属于no</li>
<li>Entropy(a(strong)):<tt>-</tt> (3/6)*log2(3/6) - (3/6)*log2(3/6) = 1.00</li>
</ul>
<p>以上就是id3的全部内容了，我们可以用recrusion的方法解决这个问题。具体示例，且听下回分解！</p>
