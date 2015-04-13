---
layout: post
title: "Foward DTFT(Discrite Time Fourier Transform) Visualiztion Using Python"
description: "This is the visualizaion of the DTFT Using Python numpy and matplotlib"
category: gsoc2015
tags: [Python]
---
{% include JB/setup %}

Due to my GSOC project is related to the image processing and digital filter, I felt that it is necessary for me to get enrolled in a [discrete processing class](https://www.edx.org/course/discrete-time-signals-systems-part-2-ricex-elec301-2x#.VR__55TF__g). I hope I can use those knowledge when it comes to EVM.

And it has been two weeks since I was enrolled in that class, I first leanrt DFT(Discrite Fourier Transform) and then the professor extend the length of the impuse signal from N to infinte, and then we get the DTFT(Discrite Time Fouier Transform).

Everything went well, well, until I got to this quick response question::confused:

![img](https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/snagit/2015-04-04_16-21-27.png) 

I felted puzzled. Because I went throught the class so fast that I havn't sit down and do the related calculation to get a full image about the whole transformation. 

And then I decided to do something to help me visualize the images.

Ok. Let put aside the physical background about the Forward DTFT, and I will not tell you it is the inner product of the signal x[n] with the arbitrary sinusoid function at frequency $$\omega$$.
What we want to visualize is the magnitude of the following:


$$H(j\omega) = \sum_{n=-\infty}^{\infty}h[n]e^{-j\omega n} $$.


And I have attached the code at the bottom for reference.

Let's take a look of the output of the function: :blush:

####1. ####
For a constant, which is described as :

$$
    x[n] = constant.
$$

And it looks like this:
<figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/4/constant_t.png">
<figcaption align='middle'><b>Demo</b></figcaption>
</figure>

Let say the constant is 1, we get the image:
<figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/4/Untitled.png">
<figcaption align='middle'><b>Constant</b></figcaption>
</figure>

What's more, as we can see from the formula:

$$H(j\omega) = \sum_{n=-\infty}^{\infty}h[n]e^{-j\omega n} $$.

The **n** range from negative infinite to plus infinite, but using we have to set it in a range using numerical approach. Changing n will have effect onto the result, so I then created an animation,
<figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/4/com-maker.gif">
<figcaption align='middle'><b>Demo</b></figcaption>
</figure>


####2. ####
For a function called "one-sided Expoonential", which is described as :

$$
    x[n] = a^n * u[n]   (|a|<1)
$$

And it looks like this:
<figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/4/tk_3.png">
<figcaption align='middle'><b>Time Domain one-sided Expoonential</b></figcaption>
</figure>
We can get:
<figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/4/moving 1.png">
<figcaption align='middle'><b>Frequency Domain one-sided Expoonential</b></figcaption>
</figure>

####3. ####
For a function called "Moving average system", which is described as:

$$
x[n] = \left\{
                \begin{array}{ll}
                  1(|n|<=M)\\
                  0(Otherwise)
                \end{array}
              \right.
$$

And this impulse response looks like this,
<figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/4/moving_2.png">
<figcaption align='middle'><b>Time Domain Moving average system</b></figcaption>
</figure>
We can get:
<figure>
<img src="https://googledrive.com/host/0B6Io4fF4zXvDTnBFeXRBM0Vja3c/images/2015/4/Untitled2.png">
<figcaption align='middle'><b>Frequency Domain Moving average system</b></figcaption>
</figure>






{% highlight python %}
"""
    This is the source code for visualization of the Forward DTFT
    
    The formula:  X(w) = sum(h(n)*exp(-j*w*n)) where n iterates from minus infinite to plus infinite
    
"""
import numpy as np
import pylab
import matplotlib.patches as mpatches
def h_fun(n):
    """   
       This is code for
       h[n] = 1 if n<=|M| Otherwise h[n] is 0
       This is called moving average system
       The Forward DTFT os this system is called "Dirichlet Kernel"
    """   
#    M = 3
#    if n<=M and n>= -M:
#        return 1
#    else:
#        return 0    
#  
    """
     This is code for
     h[n] = 1
     This impulse response is calld "constant"
    """
    return 1

    """
    This is the code for:
       h[n] = (a^n)*u[n] where |a| < 1
       This impulse response is called "one-sided Expoonential"
    """
#    if n >=0:
#        return 0.8**(n)
#    else:
#        return 0
    
def draw_y(n):
    h_res = np.float32(np.copy(n))
    for i in range(len(n)):
        h_res[i] = h_fun(n[i])
    pylab.stem(n,h_res,'-.')
    return h_res
    
def single_draw(n_range):
    fig = pylab.figure()
    ax = fig.gca()
    ax.set_autoscale_on(False)
    

    n = np.arange(-n_range,n_range,1)
    w = np.linspace(-np.pi,np.pi,10000)
    
    rot = np.dot(n[:,None],w[None,:])
    # Compensation for the documentation:
    # From the documentation:
    # http://docs.scipy.org/doc/numpy/reference/generated/numpy.dot.html#numpy.dot
    # for 1-D arrays to inner product of vectors (without complex conjugation).
    # The solution:
    # http://stackoverflow.com/questions/23566515/multiplication-of-1d-arrays-in-numpy
    # rot = np.dot(n[:,None],w[None,:])
    # related reading :
    # http://stackoverflow.com/questions/22053050/difference-between-numpy-array-shape-r-1-and-r
    
    y_temp = np.exp(-1j*rot) #y_temp.shape = (n,w)
    
    for n_iter in range(len(n)):
        y_temp[n_iter,:] = h_fun(n_iter)*y_temp[n_iter,:]
    
    y = np.sum(y_temp,axis=0)
        
    ax.plot(w,np.absolute(y),label='n=-'+str(n_range)+' -> +'+str(n_range))
    ax.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc=3,ncol=2, mode="expand", borderaxespad=0.)
    ax.axis([-5,5,-5,200])
    
    fig.savefig(str(n_range)+'.png',dpi=fig.dpi)
    

if __name__ == "__main__":
    # Swipping throught n's value, will create a lot of files 
    for n in range(10,100):
        single_draw(n)
{% endhighlight %}


