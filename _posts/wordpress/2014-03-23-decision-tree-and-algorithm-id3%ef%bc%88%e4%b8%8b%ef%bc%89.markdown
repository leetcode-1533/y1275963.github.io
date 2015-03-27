---
layout: post
status: publish
published: true
title: Decision Tree and Algorithm ID3（下）
author:
  display_name: y1275963
  login: y1275963
  email: 1275963@gmail.com
  url: ''
author_login: y1275963
author_email: 1275963@gmail.com
wordpress_id: 240
wordpress_url: http://y1275963.info/wordpress/?p=240
date: '2014-03-23 23:28:26 +0000'
date_gmt: '2014-03-23 15:28:26 +0000'
categories:
- Python
tags: []
comments: []
---
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--></p>
<div>[['h', 'h', 'w', 'n'], ['h', 'h', 's', 'n'], ['m', 'h', 'w', 'n'], ['c', 'n', 'w', 'y'], ['m', 'n', 's', 'y']]</div>
<div>0</div>
<div>[['h', 'w', 'n'], ['h', 's', 'n'], ['m', 'w', 'n']]</div>
<div>1</div>
<div>[['c', 'w', 'y'], ['m', 's', 'y']]</div>
<div>1</div>
<div>[['m', 'h', 'w', 'y'], ['c', 'n', 'w', 'y'], ['c', 'n', 's', 'n'], ['m', 'n', 'w', 'y'], ['m', 'h', 's', 'n']]</div>
<div>0</div>
<div>[['c', 'n', 'n'], ['m', 'h', 'n']]</div>
<div>2</div>
<div>[['m', 'h', 'y'], ['c', 'n', 'y'], ['m', 'n', 'y']]</div>
<div>2</div>
<div>[['h', 'h', 'w', 'y'], ['c', 'n', 's', 'y'], ['m', 'h', 's', 'y'], ['h', 'n', 'w', 'y']]</div>
<div>0</div>
<div></div>
<div>嘿嘿，一个星期的成果。</div>
<div></div>
<div>
<div>{'outlook': {'s': {'humidity': {'h': 'n', 'n': 'y'}}, 'r': {'wind': {'s': 'n', 'w': 'y'}}, 'o': 'y’}}</div>
<div>我们完成了决策树。</div>
<div>接着按照wordpress的说法写下去吧。我们今天晚上聊聊递归：</div>
<div><img class="alignnone" alt="" src="http://www.cise.ufl.edu/~ddd/cap6635/Fall-97/Short-papers/Image3.gif" width="640" height="306" /></div>
<div></div>
<div>
<div><img alt="" src="file:///Users/tk/Library/Containers/com.evernote.Evernote/Data/Library/Application%20Support/Evernote/accounts/Evernote/y1275963/content/p2688/ffe95c865be462c1425c946de24c6291.gif" />，首先，看到这个树，我们发现它有5个节点，3个分叉。也就是我的递归将连续进行两次，并被停止5次。我将按照老外的说法，实际带领大家走一遍递归。</div>
<div>在此之前呢，亮一下我将会要用到的函数：</div>
<div>
<div>
<pre class="lang:python decode:true ">def createtree(dataset,label):
    csize = len(dataset[0])-1
    clist = [temp[-1] for temp in dataset]
    if clist.count(clist[0]) == len(clist):
        return clist[0]
    if csize == 0:
        return main.majoritycnt(clist)
    besta =  choosebestfeattospli(dataset)
    bestlabel = label.pop(besta)
    mytree = {bestlabel:{}}
    # print bestlabel
    sefeatlist = [example[besta] for example in dataset]
    seunival = set(sefeatlist)
    for test in seunival:
        sublabel = label[:]
        ctemp =  tk.splistdataset(dataset,besta,test)
        mytree[bestlabel][test]=createtree(ctemp,sublabel)
    return my tree</pre>
<p>这是大循环</p>
</div>
<div>
<div>
<pre class="lang:python decode:true ">def choosebestfeattospli(dataset):
    beste = 0
    besta= 1
    basee =trees.calent(dataset)
    csize = len(dataset[0])-1
    for item in range(csize):
        featlist = [example[item] for example in dataset]
        tempdic =  chance(featlist)
        uck = 0
        for key in tempdic:
            templist = tk.splistdataset(dataset,item,key)
            utemp = trees.calent(templist)
            uck = uck + tempdic[key] * utemp
        uck = basee - uck
        if uck &gt;= beste:
            beste = uck
            besta = item
    return besta</pre>
<p>这个函数的作用是选择出最好的axis。</p>
</div>
<div>
<div>
<pre class="lang:python decode:true ">def splistdataset(dataset,axis,value):
    retdataset = []
    for featvec in dataset:
        if featvec[axis] == value:
            redecvec = featvec[:axis]
            redecvec.extend(featvec[axis+1:])
            retdataset.append(redecvec)
    return retdataset</pre>
<p>这个函数的作用是删掉已经选好的axis上所有的数据，降低其横向长度。</p>
</div>
<div>
<div>
<pre class="lang:python decode:true ">def choosebest(dataset):
    numfeat = len(dataset[0])-1
    baseen = trees.calent(dataset)
    bestfeature = -1
    bestinfo = 0
    for i in range(numfeat):
        featlist = [example[i] for example in dataset]
        uniqval = set(featlist)
        newent = 0.0
        for value in uniqval:
            subdataset = tk.splitDataset(dataset,i,value)
            prob = len(subdataset)/float(len(dataset))
            newent += prob*trees.calent(subdataset)
        infogain = baseen - newent
        if (infogain&gt;bestinfo):
            bestinfo =infogain
            bestfeature = i
    return best feature</pre>
<p>这个函数的作用是计算单元Entropy。</p>
</div>
</div>
</div>
</div>
</div>
<div>就这4个了，大家请跟好，我估计会很长的，大概要写到12点。不过特别值！</div>
<div>我们怎么调用呢：</div>
<div>
<div>print createtree(rawdata,labels)。然后程序就开始了：</div>
<div>
<hr />
<p>递归0层1次</p>
</div>
<div>首先，我们用：csize = len(dataset[0])-1测量其横向长度。</div>
<div>
<div>clist = [temp[-1] for temp in dataset]</div>
<div>    if clist.count(clist[0]) == len(clist):</div>
<div>        return clist[0]</div>
<div>    if csize == 0:</div>
<div>        return main.majoritycnt(clist)</div>
<div>这一段跳过，待会再讲（递归截止部分）</div>
<div>然后，我们调用besta =  choosebestfeattospli(dataset)，计算最应该分叉的axis。</div>
<div>对于第一次有：</div>
<div>分类entropy分别为：</div>
<div>
<div>0.246749819774</div>
<div>0.029222565659</div>
<div>0.151835501362</div>
<div>0.0481270304083</div>
<div>可以看到第零个最大，我们将其选出。besta=0</div>
<div>然后，从label中pop出来那个编号为零的label，名叫outlook</div>
<div>mytree = {outlook：{}}</div>
<div>然后，我们利用：</div>
<div>
<div>    sefeatlist = [example[besta] for example in dataset]</div>
<div>    seunival = set(sefeatlist)</div>
<div>统计了outlook，也就是编号0下的值的种类，共计三种</div>
<div>对每种，我们先吧之前删掉outlook的label抄一遍。</div>
<div>然后开始用命令：mytree[outlook][s]=;mytree[outlook][r]=;mytree[outlook][o]=的方式递归调用createtree，此时程序进行到倒数第二行。</div>
<div>
<hr />
<p>递归1层2次：</p>
</div>
<div>我们再用csize = len(dataset[0])-1测量其长度，此时，它的参数由4个降到了3个，csize=3</div>
<div>继续跳过终值递归部分，</div>
<div>我们再算besta，此时，是在[outlook][s]的基础上算的二次基entropy:其值分别为：</div>
<div>
<div>0.570950594455</div>
<div>0.970950594455</div>
<div>0.019973094022</div>
<div>第一个胜出，besta=1</div>
<div>pop出来humidity。</div>
<div>在来统计下humidity下面的值的种类，共有两种：h or n</div>
<div>此时，我们在outlook=s,humidity = h与outlook=s,humidity=n的情况下继续深入递归.此时，</div>
<div>使用了命令：</div>
<div>mytree[humidity][h]=与mytree[humidity][n]=</div>
<div>
<hr />
<p>递归2层3次：</p>
</div>
<div>我们再用csize那行去计算结果，发现len由4变3由3变到2了。</div>
<div>然后，我们搜集了clist = [temp[-1] for temp in dataset]。</div>
<div>此时的clist的情况是：['n', 'n', 'n’]。由于：</div>
<div>
<div>if clist.count(clist[0]) == len(clist):</div>
<div>        return clist[0]</div>
<div>也就是clist只有一种值，本次递归结束，返回值为n。</div>
<div>
<hr />
<p>递归2层3次：</p>
</div>
<div>由于返回了n,我们回到上次递归的开始点，此时，mytree[humidity][h]=被赋值为n</div>
<div>
<hr />
<p>递归1层2次：</p>
</div>
<div>之前mytree[humidity][h]被结束，我们来到了mytree[humidity][n]:</div>
<div>
<hr />
<p>递归2层4次：</p>
</div>
<div>这是，可以看到，它满足了：clist = ['y', 'y’]</div>
<div>本次递归结束，返回值为y</div>
<div>
<hr />
<p>递归1层2次：</p>
</div>
<div>此时，mytree[humidity][h]=n与mytree[humidity][n]=y完成了。</div>
<div>我们继续向上，&nbsp;</p>
<hr />
<p>递归0层1次：</p>
</div>
<div>当时的时候，mytree[outlook][s]的选择使得我们选择了humidity。</div>
<div>这时候，我们的mytree长成了这样：mytree[outlook][s]={'humidity': {'h': 'n', 'n': 'y’}}.</div>
<div>我们进一步来计算mytree[outlook][r]还有mytree[outlook][o]</div>
<div>然后，我们继续进行，来到了mytree[outlook][r]&nbsp;</p>
<hr />
<p>递归1层5次，</p>
</div>
<div>我们再来计算：</div>
<div>
<div>    csize = len(dataset[0])-1由于我们现在在第一层，递归由第0层发起。此时我们只删除了dataset中outlook项，</div>
<div>len = 3.</div>
<div>我们这时候可以看到递归结束语向之前也是用不到的。</div>
<div>然后besta被算成了：</div>
<div>
<div>0.019973094022</div>
<div>0.019973094022</div>
<div>0.970950594455</div>
<div>可以看到，第二个胜出。</div>
<div>此时label传入的是删掉了outlook项copy label（和1层2次是一样的）,label[2]= wind</div>
<div>我们又统计了wind下的值，分别有{'s': 'n', 'w': 'y’}</div>
<div>于是，好像递归2层4次和，2层3次。</div>
<div>我们完成了递归2层6次和递归2层7次。</div>
<div>递归回到了0层1次的时候，那个for循环我们完成了两个了：</div>
<div>
<div>for test in seunival:</div>
<div>        sublabel = label[:]</div>
<div>        ctemp =  tk.splistdataset(dataset,besta,test)</div>
<div>        mytree[bestlabel][test]=createtree(ctemp,sublabel)</div>
</div>
<div>此时，mytree[outlook][s]的值有了，mytree[outlook][r]的值有了：为{'wind': {'s': 'n', 'w': 'y'}}</div>
</div>
</div>
</div>
<div>
<hr />
</div>
</div>
</div>
</div>
<div>递归1层8次：</div>
<div>这时，我们来计算mytree[outlook][o],此时：</div>
<div>csize = 3.</div>
<div>然后计算clist，发现均为’y’</div>
<div>返回y</div>
<div>全部递归结束。</div>
<div>代码运行到倒数第一行，返回mytree</div>
<div>完成时间：</div>
<div>11：21</div>
<div>
<hr />
<p>这里有份记录，我给写点注释：</p>
</div>
<div>
<div>this is clist</div>
<div>['n', 'n', 'y', 'y', 'y', 'n', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'n']</div>
<div>0.246749819774</div>
<div>0.029222565659</div>
<div>0.151835501362</div>
<div>0.0481270304083//第一次计算，由此选出来了outlok</div>
<div>this is clist</div>
<div>['n', 'n', 'n', 'y', 'y’]</div>
<div>0.570950594455</div>
<div>0.970950594455</div>
<div>0.019973094022//s下的计算，我们把humidity</div>
<div>this is clist</div>
<div>['n', 'n', 'n’]//humidity 下我们返n</div>
<div>this is clist</div>
<div>['y', 'y’]//humidity 下 我们返 y ，一个中规模的for分支在此结束</div>
<div>this is clist</div>
<div>['y', 'y', 'n', 'y', 'n’] //我们转而投到了r</div>
<div>0.019973094022</div>
<div>0.019973094022</div>
<div>0.970950594455// r下的计算，我们把wind选出来了</div>
<div>this is clist</div>
<div>['n', 'n’] //wind下面返回n</div>
<div>this is clist</div>
<div>['y', 'y', 'y’]//wind下面返回y，一个中规模的for分支在此结束</div>
<div>this is clist</div>
<div>['y', 'y', 'y', 'y’]//我们转投到了o，一个中规模的for分支在此结束</div>
<div>{'outlook': {'s': {'humidity': {'h': 'n', 'n': 'y'}}, 'r': {'wind': {'s': 'n', 'w': 'y'}}, 'o': 'y’}}</div>
<div></div>
<div>附件：</div>
<div>测试集：</div>
<div>
<div>rawdata = [['s','h','h','w','n'],</div>
<div>           ['s','h','h','s','n'],</div>
<div>           ['o','h','h','w','y'],</div>
<div>           ['r','m','h','w','y'],</div>
<div>           ['r','c','n','w','y'],</div>
<div>           ['r','c','n','s','n'],</div>
<div>           ['o','c','n','s','y'],</div>
<div>           ['s','m','h','w','n'],</div>
<div>           ['s','c','n','w','y'],</div>
<div>           ['r','m','n','w','y'],</div>
<div>           ['s','m','n','s','y'],</div>
<div>           ['o','m','h','s','y'],</div>
<div>           ['o','h','n','w','y'],</div>
<div>           ['r','m','h','s','n']]</div>
<div>labels = ['outlook','temperature','humidity','wind',]</div>
<div>总程序:</div>
<div><a href="http://y1275963.info/wordpress/wp-content/uploads/2014/03/rawdata.py_.zip">rawdata.py</a>&nbsp;</p>
<p>&nbsp;</p>
</div>
<div>不容易啊，感觉手上能算出来了之后才敢计算，瞎按键盘只能捉急</div>
</div>
</div>
</div>
</div>
</div>
</div>
