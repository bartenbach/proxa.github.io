---
title:  "More-Leetcoding!"
date:  "2020-11-30
"
categories: career programming
---
## [Reverse String](https://leetcode.com/problems/reverse-string)

## Difficulty
Easy

This one is a bit trickier than the standard interview question because of the additional requirement that you cannot allocate additional space.  You must modify the array in-place with O(1) extra memory.

Still, not overly difficult though.

{% highlight go %}
class Solution {
    public void reverseString(char[] s) {
        for (int i = 0; i < s.length / 2; i++) {
            char tmp = s[s.length - i - 1];
            s[s.length - i - 1] = s[i];
            s[i] = tmp;
        }
    }
}
{% endhighlight %}

## Submission Details
### Runtime: 1ms, faster than 95.22% of Java online submissions
### Memory Usage: 45.7 MB, less than 76.40% of Java online submissions
