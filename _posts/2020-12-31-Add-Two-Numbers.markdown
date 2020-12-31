---
title:  "Add-Two-Numbers"
date:  "2020-12-31
"
categories: career programming
---
## [Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)

## Difficulty
Medium

Well, this certainly sounds like the easiest problem ever, but it's a little trickier than just adding the numbers.

Not by much though.  This looks pretty messy in Java with all the type conversions, but the test cases had absolutely 
huge values.  I overflowed int, overflowed long, overflowed unsigned long, and ended up just using BigInteger which 
got the job done.

{% highlight java %}
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
import java.math.BigInteger;

class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        return convertToListNode(getReversedValue(l1).add(getReversedValue(l2)));
    }

    public ListNode convertToListNode(BigInteger result) {
        char[] digits = new StringBuilder(String.valueOf(result)).reverse().toString().toCharArray();
        ListNode firstNode = new ListNode(Integer.parseInt(String.valueOf(digits[0])));
        ListNode node = firstNode;
        for (int i = 1; i < digits.length; i++) {
            node.next = new ListNode(Integer.parseInt(String.valueOf(digits[i])));
            node = node.next;
        }
        return firstNode;
    }

    public BigInteger getReversedValue(ListNode node) {
        StringBuilder sb = new StringBuilder(node.val).append(node.val);
        while (node.next != null) {
            node = node.next;
            sb.append(String.valueOf(node.val));
        }
        return new BigInteger(sb.reverse().toString());
    }
}
{% endhighlight %}

Not much else to say about this.  I think it's only classified as a medium because of the extra tedium.  It really 
wasn't very challenging though.

## Submission Details
### Runtime: **11 ms**
### Memory Usage: **39 MB**
