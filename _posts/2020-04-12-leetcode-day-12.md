---
title:  "Leetcode 30-Day Challenge: Day 12"
date:   2020-04-12 12:27:17 -0500
categories: career programming
---
# [Last Stone Weight](https://leetcode.com/problems/diameter-of-binary-tree/)

### Difficulty: Easy

## Problem statement:

> We have a collection of stones, each stone has a positive integer weight.  
>   
> Each turn, we choose the two heaviest stones and smash them together.  Suppose the stones have weights x and y with x <= y.  The result of this smash is:  
>   
> If x == y, both stones are totally destroyed;  
> If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.  
> At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)  
>   
>   
>   
> Example 1:  
>    
> `Input: [2,7,4,1,8,1]`  
> `Output: 1`   
> `Explanation:`   
> `We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,`   
> `we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,`   
> `we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,`   
> `we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.`   
>   
>   
> Note:   
>   
> `1 <= stones.length <= 30`   
> `1 <= stones[i] <= 1000`    

## Solution

Happy rainy Omaha Sunday!  Today's challenge wasn't too bad.  I read through the problem a few times and wrote some code and happen to solve it within a few runs.

The time complexity on this is dependent upon the call to `sort.Ints([]int)`.  [Looking at the source code](https://github.com/golang/go/blob/master/src/sort/sort.go#L218), we can see that Go implements quicksort for this.  We can reference [Big-O Cheat Sheet](https://www.bigocheatsheet.com) (or google really) to see that we're on average getting `Θ(n log(n))` for this.  I don't claim to be a master of asymptotic analysis, but I believe having this quicksort inside my while loop promotes this solution to `O(n²)` (please correct me if I'm mistaken).

That being said, our solution's runtime ended up being 0 milliseconds.  Space complexity would be `O(n)`

{% highlight go %}
func lastStoneWeight(stones []int) int {
    x, y, err := getHeaviestStones(stones)
    for err == nil {
        stones = smashStones(x, y, stones)
        sort.Ints(stones)
        fmt.Println(stones) 
        x, y, err = getHeaviestStones(stones)  
    }
    
    if len(stones) > 0 {
      return stones[0]
    }
    return 0
}

func smashStones(x, y int, stones []int) []int {
    if x == y {
        stones = stones[:len(stones) - 2]
    } else {
        stoneY := y - x
        stones = stones[:len(stones) - 1] 
        stones[len(stones) - 1] = stoneY
    }
    return stones
}

func getHeaviestStones(stones []int) (int, int, error) {
    if len(stones) < 2 {
        return -1, -1, errors.New("Array size must be at least two!")
    }
    sort.Ints(stones)  
    return stones[len(stones) - 2], stones[len(stones) - 1], nil
}
{% endhighlight %}

### Solution Details
Runtime: 0 ms
Memory Usage: 2 MB
