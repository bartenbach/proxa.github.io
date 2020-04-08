---
title:  "Leetcode 30-Day Challenge: Day 7"
date:   2020-04-07 18:50:17 -0500
categories: career programming
---
# [Counting Elements](https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3289/)

Difficulty: ?

Problem statement:

> Given an integer array arr, count element x such that x + 1 is also in arr.
> 
> If there're duplicates in arr, count them seperately.
> 
> Example 1:
> Input: arr = [1,2,3]
> Output: 2
> Explanation: 1 and 2 are counted cause 2 and 3 are in arr.
> 
> Example 2:
> Input: arr = [1,1,3,3,5,5,7,7]
> Output: 0
> Explanation: No numbers are counted, cause there's no 2, 4, 6, or 8 in arr.
>
> Example 3:
> Input: arr = [1,3,2,3,5,0]
> Output: 3
> Explanation: 0, 1 and 2 are counted cause 1, 2 and 3 are in arr.
>
> Example 4:
> Input: arr = [1,1,2,2]
> Output: 2
> Explanation: Two 1s are counted cause 2 is in arr.

*This appears to be a brand new problem.*  I provided the only URL I have, but it will likely change.  No difficulty rating is provided, although in my opinion, I'd say this should be an Easy.

It seems that today the gods of leetcode have shone down upon me (much like the sun did in Omaha today).  Today's problem was one of the easiest problems yet.  Perfect for continuing to use Go!

This solution really needs no explaining.  It's the brute force, obvious solution.  It's O(n²), but it was accepted.  I haven't yet peeked to see the O(n) solution if there is one.  I played around for a bit but every idea I had to drop this to O(n) was thwarted by an evil test case.

{% highlight go %}
func countElements(arr []int) int {
    counter := 0
    for _,v := range arr {
        if contains(arr, v+1) {
            counter++
        }
    }
    return counter
}

func contains(arr []int, x int) bool {
    for _,v := range arr {
        if v == x {
            return true
        }
    }
    return false
}
{% endhighlight %}
