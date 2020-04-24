---
title:  "Leetcode 30-Day Challenge: Day 23"
date:   2020-04-23 08:27:17 -0500
categories: career programming
---
# [Bitwise AND of Numbers Range](https://leetcode.com/problems/bitwise-and-of-numbers-range/)

### Difficulty: Medium

## Problem statement:

> Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.
>  
> *Example 1:*  
>    
> `Input: [5,7]`  
> `Output: 4`    
> *Example 2:*  
>    
> `Input: [0,1]`    
> `Output: 0`    

## Solution
 
I first set out to solve this in an O(n) fashion in much the way you might expect; iterating through all numbers in the given range and performing an AND operation.  Unfortunately 
for me, they decided to set a time limit for this exercise to prevent just that!  I don't have my simple loop anymore, but it passed all 8300 odd cases but was _too slow_.

Even after stepping through the solution, I was still pretty baffled.  I won't try to explain it here because it takes a bit of deep diving to really comprehend, but the gist of the solution is that the binary representation of a range of numbers is going
 to share a given prefix.  The idea is that you start bit shifting both integers until they are equal.  Once you've done that, you've found the common prefix that the numbers share.

If you count the number of shifts done to reach equality, you can then shift them back to get the solution. The reason this works is a consequence of the AND function really.  Anything that doesn't match is going to get zeroed out anyway.

{% highlight go %}
func rangeBitwiseAnd(m int, n int) int {
    shifts := 0
    for m != n {
        m = m >> 1
        n = n >> 1 
        shifts++
    }
    return m << shifts
}
{% endhighlight %}

Surprisingly simple.  The challenge here lies not in complex algorithms but just in understanding base two and how the system can be manipulated via bitwise operations.
