---
title:  "Median-of-Two-Sorted-Arrays"
date:  "2020-12-31
"
categories: career programming
---
I'm not sure whether I'm getting better at these or the harder problems aren't actually that hard...

## [Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)

## Difficulty
Hard

{% highlight java %}
class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int[] combined = new int[nums1.length + nums2.length];
        System.arraycopy(nums1, 0, combined, 0, nums1.length);
        System.arraycopy(nums2, 0, combined, nums1.length, nums2.length);
        Arrays.sort(combined);
        int half = combined.length / 2;
        if (combined.length % 2 == 0) {
            return (double) ((combined[half-1] + combined[half]) / 2.0);
        }
        return (double) combined[half];
    }
}
{% endhighlight %}

## Submission Details
### Runtime: **3 ms**
### Memory Usage: **40 MB**
