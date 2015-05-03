---
layout: post
title: "How to speed up the Matlab code by performance analyzing"
description: ""
category: Matlab 
tags: [Matlab]
---
{% include JB/setup %}

Recently I was required to write some matlab code to simulate the modulation and demodulation of a signal. The original code itself is working but it is just too slow, unsatisfied with the speed I decide to dig in and try to speed it up. 

To try to analyze the code efficiency, you do command like this:

{% highlight Matlab linenos %}
 profile viewer
{% endhighlight %}

And it will setup a windows like below for you:


<img src=" https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/snagit/2015-05-03_11-33-45-1.png " width="400" height="400" />

What you need to do is to click on the button called *Start Profiling*. As annotated above. 

And then what you need to do is just to execute the code you want to run for once, for me, it is:
{% highlight Matlab linenos %}
 main(5)
{% endhighlight %} 

Because the code isn't improved and it is very slow, I waited for 1 minute to get the result.

and after that you call the *profile viewer* again.

{% highlight Matlab linenos %}
 profile viewer
{% endhighlight %}

And this time you just stop recording:


<img src=" https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/snagit/2015-05-03_11-43-32.png " width="400" height="400" />

And you will see the program you just run is at the top of the viewer. Let us just click into and have a look, as we can see, the report said to me that my code needs 160 seconds to run,


<img src=" https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/snagit/2015-05-03_11-50-52.png " width="400" height="400" />

See that column saying *lines where the most time was spent*? This is what I want, for me, code in line 42 consumes 57% of running time and code in 15-17 consumes 30% of running time, let's have a look what they really are:
{% highlight Matlab linenos %}
    k=1;
    for i = 1:N
        for j = 1:samplesPerBit  % these loops create the
            y(k) = data(i);      % bit stream: y is 8000hz(8000 samples per second), data is 1000 samples per second
            k=k+1;
        end 
    end  
{% endhighlight %}

This is the code around line 15, that this one is trying to do is just to repeat a vector for 8 times, but I used a *for* loop to do so, Matlab is not good at for loop.

And this is the code around line 42, not surprised, it is a *for* loop again:
{% highlight Matlab linenos %}
    for index = 1:samplesPerBit:length(y)
        temp = Filtered_signal(index:index+samplesPerBit-1);
        new_data(ceil(index/8)) = mean(temp) > 0.25;  %attundate by half
    end
{% endhighlight %}
This one is just to average a vector every 8 bits. 

Those two can all be modified in *vectorized fashion*, for the first one, I did
{% highlight Matlab linenos %}
    y=repmat(data,1,samplesPerBit)';
    y = y(:)';
{% endhighlight %} 
For the second one, I did:
{% highlight Matlab linenos %}
    yy = reshape(Filtered_signal,samplesPerBit,[]);
    temp = mean(yy);
    new_data = temp > 0.25;
{% endhighlight %}

They are the same, the only difference is just that I vectorized the code. Usually we need to try to figure out a way to not to use *for* loop and instead to create a very big vector and let Matlab just calculate the big vector for one time.

Let see how much time does this one cost:
<img src=" https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/snagit/2015-05-03_12-02-36.png " width="400" height="400" />


It improves a a lot, isn't? And for now, the most time consuming part is the calculation of a cosine function which is something I cannot improve.

I appended the [code](https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/5/main.m), so if you are interested in, you can try to comment and uncomment and try to feel the difference of vectorizing the code.