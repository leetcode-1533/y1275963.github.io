---
layout: post
title: "Matlab implementation of the simplest one"
description: "This is my GSOC2015 log"
category: GSOC2015
tags: [Matlab,VTK]
---
{% include JB/setup %}

As we can see from the [previous tutorial ](http://y1275963.github.io/gsoc2015/2015/03/22/basics/), we have got the idea of how to do it.
And I do have implemented it using Matlab. And I would like to write a detailed description of what I have done, the [code](https://github.com/y1275963/matlab_evm) is not optimized and is pretty slow, but I got the way to work around it.

I thought the simplest combination should be using ideal filter( Just FFT is enough) in temporal domain and Gaussian pyramid in spatial domain. And doing so will allow us to amplify the color vibration.(As what the demo have done)

I have two branches for the code, one for testing another for real, the reason is simply that the real application is too slow.

I find out that the code itself is very effective considering that we only need to have operation on the top of the pyramid and it indeed is a very small image.(It is reducing exponentially, taking the example of the _face.avi_, it is from  (592, 528) to (37,33) after 4 times of compression ) The most of time was spent on reading in the video and convert the original RGB color space into YIQ(The paper suggest us to work on this color space, and I found out that amplify different components in this space will amplify different aspects of the changes, like one is more for motion and another one is more for color). 

So I decide to store those preset value, it is fixed for this video. And for testing, I avoided the process of creating video, I just created a series of images.

Time for the code.

##1. Spatial Decomposition ##
{% highlight matlab %}
    function fourth_reduce = stack2yiq(vid,ori)

    load('ori_data');
    size(ori)
        
    for i = 1 : 1 : vid.NumberOfFrames
        ntsc_stack(:,:,:,i) = rgb2ntsc(ori(:,:,:,i));
    end

    for i = 1 : 1 : vid.NumberOfFrames
        first_reduce(:,:,:,i) = impyramid(ntsc_stack(:,:,:,i),'reduce');
        second_reduce(:,:,:,i) = impyramid(first_reduce(:,:,:,i),'reduce');
        third_reduce(:,:,:,i) = impyramid(second_reduce(:,:,:,i),'reduce');
        fourth_reduce(:,:,:,i) = impyramid(third_reduce(:,:,:,i),'reduce');
    end


        

    return 
{% endhighlight %}

We immediately change the color space to YIQ once we got the video images.

After that, because we have the matlab code for creating a pyramid from the image, to create a fourth order pyramid is simply to do it 4 times. And we do it for all the frames.

The returned image is the top of the pyramid.

##2. Temporal Filtering ##
{% highlight matlab %}

    function filtered = low_pass(data,fl,fh,vid,channel)

    length = vid.NumberOfFrames;
    samplingRate = vid.FrameRate;

    r_test = data(:,:,channel,:);

    r_fft = fft(r_test,[],4)/length;

    Freq = 1:length;
    Freq = (Freq-1)/length*samplingRate;
    mask = Freq > fl & Freq < fh;

    r_fft(:,:,:,~mask) = 0;


    filtered = real(ifft(r_fft,[],4));

{% endhighlight %}

Using the ideal filter is quite straight froward,

 * From time domain. we have,
    * x-axis as time  
    * y-axis as magnitude. 
 * Come to frequency domain, we have,
    * x-axis as frequency
    * y-axis as magnitude 

We just retrieve the desired part( we assume the color vibration frequency to be same the human pulse, which is around 5/6 to 1 a second) of the function in the frequency domain by creating a mask(each index of FFT result stands for this magnitude's frequency, and we can know in advance that which part of the FFT result is we what). After applying the ideal filter, we use IFFT to convert it back.

One thing to notice, that FFT works best with the sample number in the power of 2 due to its own property, and as we what to keep the number of frame in constant to avoid interpolation,(Because if we introduce some more frames we must find a way to average it down) we just generate the result with the same number of frame as the input video. That is, taking the _face.avi_ for example, we have 301 frames, and after FFT we have 301 samples of frequencies and after the filter and IFFT we still have 301 frames. 

##3. Combining Them Up ##
{% highlight matlab %}

    function new_filtered = amplifier(vid,ori)
    % Amplify ratio configurable
    % Bandpass location configurable

    % data = stack2yiq(vid,ori);
    load gauss.mat
    data = gauss;

    fl = 5/6;
    fh = 1;

    y_filtered = low_pass(data,fl,fh,vid,1);
    i_filtered = low_pass(data,fl,fh,vid,2);
    q_filtered = low_pass(data,fl,fh,vid,3);

    y_filtered = y_filtered * 50;
    i_filtered = i_filtered * 50;
    q_filtered = q_filtered * 50000;

    new_filtered(:,:,1,:) = y_filtered;
    new_filtered(:,:,2,:) = i_filtered;
    new_filtered(:,:,3,:) = q_filtered;

{% endhighlight %}

To amplify is straight forward, because we are doing the color magnification and artifacts is acceptable, we just amplify the selected frequency from the top of the pyramid at a constant rate. 

To amplify from the top of pyramid( just suppose the pyramid as a compressed version of the original video), we first send the Y,I,Q values along the frames into the low\_pass, this is a scalar value, and the total sample number is 301, the value it self stand for at the certain pixel location for the certain channel(Y or I or Q) the change of the magnitude value over the time. And after the low\_pass filter, we get the same number of the frame, and we amplify(multiple it by a constant) it individually. We can make experiments in terms of amplifying ratio by changing the ratio.

We need to do this amplification for all the channels and for all the pixels.

##4. Get the result##

After this, we have got the desired mask, we just resize the mask to be like its original size and add it back:

{% highlight matlab %}

    filtered = imresize(new_filtered(:,:,:,i),[vid.Height,vid.Width]);
    pic_test = rgb2ntsc(ori(:,:,:,i)) + filtered;

{% endhighlight %}

And we can generate an video according to the original video's sample rate.

##5. Result##

Below is the video comparison,

Original video:

{% youtube 5wvZ0eYjHi0 %} 

Color amplified video:

{% youtube 533TsYwtqUc %}

##6. What's next?##

According to the Email from David, I want to move on to _vtkImageData_ and C\+\+ along with boost and VTK.


> Here are some ideas to get you warmed up:
> 
> I think I would go about it by first trying to implement pretty much exactly what the paper says: grab an image stream, apply the described operations in one or more vtk image filters, display the output. 
> 
> You could start by teaching yourself how to use the window to image filter to capture a render window's buffer back into an vtkImageData, and then apply some simple vtk's Image processing filters to it to modify it, then show that in a second window. Put that into a loop where you play through a time varying data set and you are well on your way. You would then just have to find or implement the filters that the paper describes.
>  
> After learning the algorithm and VTK you could expand from there. Ideally the filter would work directly on VTK's time varying data instead of relying on some external loop. Andy (cc'd) was thinking that it would be interesting to apply the technique on general time varying data sets instead of the contents of the window. We were both thinking that it would be neat to expose the filter and the result window in ParaView.
> 
> I hope that helps. Don't hesitate to ask us or better yet the vtk mailing list with more questions.
> 
> thanks for considering VTK in GSoC and good luck with your application!
> 
> David E DeMarle
> Kitware, Inc.
> R&D Engineer
> 21 Corporate Drive
> Clifton Park, NY 12065-8662
> Phone: 518-881-4909
> 



 

