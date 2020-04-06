---
title:  "Leetcode 30-Day Challenge: Day 3"
date:   2020-04-03 8:50:17 -0500
categories: career programming
---
# [Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)

Difficulty: Easy

Problem statement:

> Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
> 
> Example:
> Input: [-2,1,-3,4,-1,2,1,-5,4],
> Output: 6
> Explanation: [4,-1,2,1] has the largest sum = 6.

So, after yesterday's upset, I was determined to solve this one using Go.

I think my inability to use go effectively still is causing me to write less efficient code, but nonetheless I am learning.  The solution I developed is O(n²).  Not ideal, but it was accepted!  Without any research of how to best approach the situation at all, I whiteboarded it out and came to the conclusion that I'd just brute force it and see how it went.  My solution ended up getting accepted so, perhaps later on I'll look into smarter ways to do this.

{% highlight go %}  
import "math"

func maxSubArray(nums []int) int {
    max := math.MinInt32
    for i := range nums {
        total := getTotal(nums, i, max)
        if (total > max) {
            max = total
        }
    }
    return max
}

func getTotal(nums []int, position int, currentMax int) int {
    total := 0
    tmpMax := currentMax
    for i := position; i < len(nums); i++ {
        total += nums[i]
        if (total > tmpMax) {
            tmpMax = total
        }
    }
    if total > tmpMax {
        return total
    }
    return tmpMax
}
{% endhighlight %}
