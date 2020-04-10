---
title:  "Leetcode 30-Day Challenge: Day 10"
date:   2020-04-10 16:50:17 -0500
categories: career programming
---
# [Min Stack](https://leetcode.com/problems/min-stack/)

Difficulty: Easy

Problem statement:

> Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.  
>   
> * push(x) -- Push element x onto stack.  
> * pop() -- Removes the element on top of the stack.  
> * top() -- Get the top element.  
> * getMin() -- Retrieve the minimum element in the stack.  
>    
>   
> Example:  
>   
> `MinStack minStack = new MinStack();`  
> `minStack.push(-2);`    
> `minStack.push(0);`  
> `minStack.push(-3);`   
> `minStack.getMin();   --> Returns -3.`  
> `minStack.pop();`  
> `minStack.top();      --> Returns 0.`  
> `minStack.getMin();   --> Returns -2.`  

So...fun fact, I deleted all my code for this challenge on accident and had to redo it!  Backstory: I went to make this post and I realized my vim setup sucked.  Staying home due to COVID-19 has made me stir crazy.  Well, that and my home setup has always been okay, but as I have grown older it no longer matches what I would consider to be an _ideal_ work from home setup.  Ten years of banging away at a keyboard has made me realize things: 
1. I probably won't be switching careers any time soon.
2. I should take care of my body because I only get one.

That being said, I've been less and less interested in "cool" hardware and more and more interested in *ergonomics*.  Things that help keep my body in top shape so I can live a long, happy life.  Stuff like standing desks, chairs or stools that improve posture, mice that are made to minimize the effects of RSI & carpal tunnel, etc.  Of course, that has led me to really absurd ideas like swapping keyboard maps (something I've actually done before.  I can type Dvorak decently.  I could probably make an entire separate post on my feelings about alternative keymaps though), or keyboards like the Kinesis Advantage 2 and ErgoDox EZ (pictured below).

![Kinesis Advantage 2](/assets/images/kinesis.jpg)
![ErgoDox EZ](/assets/images/ergodox.jpg)

Anyway, I'm going down a rabbit hole here, but basically I've been trying to redo my home setup to make it match what I currently want in a work desk - because it's definitely not that.  The first part came today, and that was my 32 inch BenQ HDR display.  It's awesome.  I forgot how badly the web sucked in 4k though.  Still looks like we have a ways to go there, so I had to scale the text up a bit otherwise it's absurd and unreadable.

Other than that, it's great.  Took some time to get everything configured, but I completely moved my Windows/Linux PC into the closet for the time being.  I don't know if I really need it anymore.  Lately I've been thinking more about living more "minimalist" and a big, loud desktop PC that dual boots is just not something I need anymore.  If I have my MacBook Pro and a dock, I can do everything I need to do.  So that's the plan going forward: just my MacBook Pro and a dock.  I can dock in when I'm home and use the big display - then when I need to head to class or I'm traveling, I can just grab it and go - no more syncing filesystems or pushing to repositories, it's the _same machine_.

Anyway, I'm totally off-topic.  I got lost in vim configuration for this new display and totally deleted my solution like a dumbass.  I tried to recover it, but leetcode doesn't save your solution, so I had to solve it again.  Fortunately for me, I could use the practice and it was pretty easy anyway.

This solution doesn't really have a time complexity because today you're designing an object.  I suppose if we were to look at the functions I was asked to design and ask ourselves which has the worst time complexity, it would be `GetMin()` which has a time complexity of O(n).  The space complexity of the object would just be O(n) as well - the size of the elements that you push onto it.

{% highlight go %}
type MinStack struct {
    stack []int
}


/** initialize your data structure here. */
func Constructor() MinStack {
    return MinStack{}
}


func (this *MinStack) Push(x int)  {
    this.stack = append(this.stack, x)
}


func (this *MinStack) Pop()  {
    this.stack = this.stack[:len(this.stack) - 1]
}


func (this *MinStack) Top() int {
    return this.stack[len(this.stack) - 1]
}


func (this *MinStack) GetMin() int {
    min := math.MaxInt32 
    for i := 0; i < len(this.stack); i++ {
        if this.stack[i] < min {
            min = this.stack[i]
        }
    }
    return min
}


/**
 * Your MinStack object will be instantiated and called as such:
 * obj := Constructor();
 * obj.Push(x);
 * obj.Pop();
 * param_3 := obj.Top();
 * param_4 := obj.GetMin();
 */
{% endhighlight %}
