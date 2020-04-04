---
title:  "Leetcode 30-Day Challenge: Day 4"
date:   2020-04-04 8:50:17 -0500
categories: career programming
---
# [Move Zeroes](https://leetcode.com/problems/move-zeroes/)

Problem statement:

> Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
> 
> Example:
> 
> Input: [0,1,0,3,12]
> Output: [1,3,12,0,0]
> Note:
> 
> You must do this in-place without making a copy of the array.
> Minimize the total number of operations.

Determined to continue making progress in my quest to learn Go, I set off this morning with that goal in sight.

What became apparent rather quickly was just how little I understood slices in Go.  Mikayla was able to finish this problem relatively quickly, but it took me an extra half hour or so of research.  In the end, learned quite a bit!

My solution is definitely O(n), but the weird "peeking ahead" thing I had to do to past the last testcase is super sketchy.  I'm really not happy with that, but I also don't like the solution of iterating through the array several times to "count up the zeroes" first.  There are definitely some better solutions out there, but this got the job done (and quickly).

The runtime was *4ms* with a runtime complexity of *O(n)* and a space complexity of *O(1)* (I'm not allocating anything new).

{% highlight go %}  
func moveZeroes(nums []int)  {
    for i := 0; i < len(nums); i++ {
        if nums[i] == 0 {
            nums = append(nums[:i], nums[i+1:]...)
            nums = append(nums, 0)
            if i+1 < len(nums) && nums[i+1] != 0 || i+2 < len(nums) && nums[i+2] != 0 {
                i--
            }
        }
    }
}
{% endhighlight %}
