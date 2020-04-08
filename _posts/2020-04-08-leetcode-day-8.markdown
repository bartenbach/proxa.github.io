---
title:  "Leetcode 30-Day Challenge: Day 8"
date:   2020-04-08 18:50:17 -0500
categories: career programming
---
# [Middle of the Linked List](https://leetcode.com/problems/middle-of-the-linked-list/)

Difficulty: Easy

Problem statement:

> Given a non-empty, singly linked list with head node head, return a middle node of linked list.
> 
> If there are two middle nodes, return the second middle node.
> 
>  
> 
> Example 1:
> 
> Input: [1,2,3,4,5]
> Output: Node 3 from this list (Serialization: [3,4,5])
> The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
> Note that we returned a ListNode object ans, such that:
> ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
> 
> Example 2:
> 
> Input: [1,2,3,4,5,6]
> Output: Node 4 from this list (Serialization: [4,5,6])
> Since the list has two middle nodes with values 3 and 4, we return the second one.
>  
> 
> Note:
> 
> The number of nodes in the given list will be between 1 and 100. 

Another painfully easy problem.  I'm surprised they didn't start with these sooner.

My solution is extremely obvious.  Time complexity is O(n) and space complexity is O(n).

{% highlight go %}
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func middleNode(head *ListNode) *ListNode {
    elements := []*ListNode{}
    for head != nil {
        elements = append(elements, head)
        head = head.Next
    }
    return elements[len(elements) / 2]
}
{% endhighlight %}
