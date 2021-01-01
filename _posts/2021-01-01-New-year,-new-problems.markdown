---
title:  "New-year,-new-problems"
date:  "2021-01-01
"
categories: career programming
---
This took me a bit longer than it probably should have because of subtle issues I didn't foresee that the test cases 
definitely test for.  All in all though, not too tricky.  These harder problems aren't so bad, really.

## [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

## Difficulty
Medium

{% highlight java %}
class Solution {
    public int lengthOfLongestSubstring(String s) {
        List<Character> acc = new ArrayList<>();
        int longest = 0;
        for (char x : s.toCharArray()) {
            if (acc.contains(x)) {
                acc = acc.subList(acc.indexOf(x) + 1, acc.size());
            }
            acc.add(x);
            if (acc.size() > longest) {
                longest = acc.size();
            }
        }
        return longest;
    }
}
{% endhighlight %}

## Submission Details
### Runtime: **1640 ms**
### Memory Usage: **39 MB**
