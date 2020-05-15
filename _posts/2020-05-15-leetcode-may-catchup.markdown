---
title:  "Leetcode May: More Catch Up & Binary Tree Fun"
date:   2020-05-15 08:27:17 -0500
categories: career programming
---
## [Cousins in Binary Tree](https://leetcode.com/problems/cousins-in-binary-tree/)

So for today I decided to go back to a problem I previously skipped because it hurt my brain to think about.  I've never exactly 
been an authority on binary search trees, much less just binary trees, so I knew this was going to hurt.

It turns out (as usual) there's a couple different ways you can go about this.  I really wanted to work on my breadth-first search 
algorithm skills and I feel like that's the intuitive solution here, so that's what I did.

At each level of the binary tree, I add all the children to a queue for processing while checking to see if any of the nodes are my target nodes. 
If I manage to find two non-nil nodes at the same depth in the tree, I can quickly check to see if their parents are the same, and if they're not, 
I've found my cousins.  

I can also short-circuit the entire thing if I find one target node but not the other at any given depth and just return false, which I've added to the algorithm.


### Submission Details
Runtime: **0 ms**
Memory Usage: **2.5 MB**

{% highlight go %}
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isCousins(root *TreeNode, x int, y int) bool {
    parentQueue := []*TreeNode{}
    parentQueue = append(parentQueue, root)
    for {
        var xParent *TreeNode
        var yParent *TreeNode
        childQueue := []*TreeNode{}
        for len(parentQueue) > 0 {
            tmpQueue := []*TreeNode{}
            currentNode := parentQueue[0]
            parentQueue = parentQueue[1:]
            tmpQueue, xFound, yFound := collect_children(currentNode, x, y)
            if xFound != nil {
                xParent = xFound
            }
            if yFound != nil {
                yParent = yFound
            }
            childQueue = append(childQueue, tmpQueue...)
            // two non-nil nodes with different parents
            if xParent != nil && yParent != nil && xParent.Val != yParent.Val {
                return true
            }
        }
        // if we found one node on this depth but not the other, they can't be cousins
        if (xParent != nil && yParent == nil) || (xParent == nil && yParent != nil) {
            return false
        }
        parentQueue = childQueue
        if len(childQueue) == 0 {
            break
        }
    }
    return false
}

func collect_children(node *TreeNode, x int, y int) ([]*TreeNode, *TreeNode, *TreeNode) {
    childQueue := []*TreeNode{}
    var xParent *TreeNode
    var yParent *TreeNode
    if node.Left != nil {
        if node.Left.Val == x {
            xParent = node    
        } else if node.Left.Val == y {
            yParent = node
        }
        childQueue = append(childQueue, node.Left)
    }
    if node.Right != nil {
        if node.Right.Val == x {
            xParent = node    
        } else if node.Right.Val == y {
            yParent = node
        }
        childQueue = append(childQueue, node.Right)
    }
    return childQueue, xParent, yParent
}
{% endhighlight %}
