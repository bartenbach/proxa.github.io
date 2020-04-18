---
title:  "Leetcode 30-Day Challenge: Day 17"
date:   2020-04-17 08:27:17 -0500
categories: career programming
---
# [Number of Islands](https://leetcode.com/problems/number-of-islands/)

### Difficulty: Medium

## Problem statement:

> Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.  
>   
> `Example 1:`    
>     
> `Input:     `  
> `11110      `  
> `11010      `  
> `11000      `  
> `00000      `  
>  
> `Output: 1  `  
> `Example 2: `  
>   
> `Input:     `  
> `11000      `  
> `11000      `  
> `00100      `  
> `00011      `  
>   
> `Output: 3  `  

## Solution

I had seen and solved this problem before previously, so I had little doubt that I could do it.  I'm using a new language, but I'm starting to finally feel comfortable with it.

This solution is really straightforward.  If I find land, I mark it as an island and enter a method where I check up, down, left, and right for more land.  Any time I find more land I mark it as visited with a zero, which I guess brings me to the only noticeable difference here compared to my Java solution - I'm using ASCII values because I have a two dimensional array of bytes.  I don't remember using ASCII with the Java one.  Anyway, I didn't have these memorized, I just printed them out.

No wizardry.  This solution's runtime complexity is either `O(i*j)` or if `i == j` then `O(i²)`.

As a final note, I peeked at all the solutions on leetcode currently and mine is definitely the most succinct.

{% highlight go %}
func numIslands(grid [][]byte) int {
    var islands int
    for i := 0; i <= len(grid) - 1; i++ {
        for j := 0; j <= len(grid[i]) - 1; j++ {
            if grid[i][j] == 49 {
                islands++
                grid = markIsland(grid, i, j)
            }
        }
    }
    return islands
}

func markIsland(grid [][]byte, i int, j int) [][]byte {
    if i >= 0 && i < len(grid) && j >= 0 && j < len(grid[i]) {
        if grid[i][j] == 49 {
            grid[i][j] = 48
            grid = markIsland(grid, i+1, j)
            grid = markIsland(grid, i-1, j)
            grid = markIsland(grid, i, j+1)
            grid = markIsland(grid, i, j-1)
        }
    }
    return grid
}
{% endhighlight %}

### Solution Details
Runtime: 0 ms
Memory Usage: 2.9 MB
