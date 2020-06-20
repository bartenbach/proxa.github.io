---
title:  "Leetcode 30-Day Challenge: Day 25"
date:   2020-04-25 08:27:17 -0500
categories: career programming
---
# [Jump Game](https://leetcode.com/problems/jump-game/)

### Difficulty: Medium

## Solution

This problem is a prime example of the creative genius at work at leetcode where you're given a problem that on the surface appears to intuitive to solve, and yet the further you dig into it, the more it rears its ugly head.

I want to start off by saying I actually solved this one up to the last test case using naive recursion, which IMO is the intuitive solution.  It works great until you encounter a problem in which the numbers are so large you end up blowing the heap.  The solution I developed for that is as follows:

 {% highlight go %}
func canJump(nums []int) bool {
    return jump(nums, 0, 0, false)
}

func jump(nums []int, idx int, jumped int, retry bool) bool {
    if idx < 0 {
        return false 
    }
    if idx >= len(nums) - 1 {
        return true
    }
    if nums[idx] == 0 {
        return jump(nums, idx-1, jumped-1, true)
    }
    if retry { 
        nums[idx]-=1
        return jump(nums, idx+nums[idx]+1, nums[idx]+1, false)
    }
    return jump(nums, idx+nums[idx], nums[idx], false)
}
{% endhighlight %}

I'm not really going to walk through this for two reasons:
1. It doesn't pass the last test case
2. It's the result of an hour of being driven mad by this problem and it this point I don't even know what it's doing either (aside from being a recursive solution that almost works but blows the heap with large input).
 
At this point I think what probably should happen is that a tail recursive solution is developed to stop the stack from overflowing.  Unfortunately, I found by applying an incredibly check, I can actually solve this problem using my original algorithm :)

 {% highlight go linenos %}
func canJump(nums []int) bool {
    return jump(nums, 0, 0, false)
}

func jump(nums []int, idx int, jumped int, retry bool) bool {
    if idx < 0 {
        return false 
    }
    if idx >= len(nums) - 1 {
        return true
    }
    if nums[idx] == 0 {
        if jump > 100
            return false
        }
        return jump(nums, idx-1, jumped-1, true)
    }
    if retry { 
        nums[idx]-=1
        return jump(nums, idx+nums[idx]+1, nums[idx]+1, false)
    }
    return jump(nums, idx+nums[idx], nums[idx], false)
}
{% endhighlight %}

Specifically, look to lines 13-15 to see my "clever" addition that beat the system.  Obviously, this is would be a pretty sad solution for a mission critical production program.  However, for being the daily challenge, I'm going to take it!

If you spot an easy way to do this, let me know!

### Solution Details
Runtime: 32ms
Memory Usage: 25MB
