---
title:  "Leetcode May Continued!"
date:  2020-05-16
 
categories: career programming
---
## [Flood Fill](https://leetcode.com/problems/flood-fill/)

## Difficulty: Easy

Doesn't it seem like every problem on this website is categorized "Easy"?  I feel like this question is at least a Medium...

This is just another breadth-first search algorithm problem, but I really like the guise of having a practical application with the image fill example. This
 reminds me of the paint bucket tool in and image editing software.  You just have to keep looking for like pixels in all four directions and replacing the content if and only if 
 the color matches the original color that you started with.

There were some faster solutions to this problem, but I would argue that mine is WAY easier to read (and apparently uses less memory than 100% of Go submissions).

{% highlight go %}
type coord struct {
    x int
    y int
}

func floodFill(image [][]int, sr int, sc int, newColor int) [][]int {
    start := coord{sr, sc}
    initialColor := image[sr][sc]
    image[start.x][start.y] = newColor

    // this was an actual test case.  replacing one color with the same color
    // results in no actual change to the image.
    if initialColor == newColor {
        return image
    }

    pixelQueue := []coord{}
    directions := []coord{
        {1, 0},
        {0, 1},
        {-1, 0},
        {0, -1},
    }

    pixelQueue = append(pixelQueue, start)
    for len(pixelQueue) > 0 {
        pixel := pixelQueue[0]
        pixelQueue = pixelQueue[1:]
        for _,direction := range directions {
            newx := pixel.x + direction.x
            newy := pixel.y + direction.y
            if newx >= 0 && newx <= len(image) - 1 && newy >= 0 && newy <= len(image[0]) - 1 {
                if image[newx][newy] == initialColor {
                    image[newx][newy] = newColor
                    pixelQueue = append(pixelQueue, coord{newx,newy})
                }
            }
        }
    }
    return image
}
{% endhighlight %}

## Submission Details
### Runtime: **12 ms**
### Memory Usage: **4.5 MB**

## [Single Element in a Sorted Array](https://leetcode.com/problems/single-element-in-a-sorted-array/)

## Difficulty: Medium

A medium?  Really?  Who's doing the rankings here?  I'll do an easy that takes me hours but a medium takes 10 minutes.

Well, this is pretty straightforward.  I just add elements to a list and delete them when they come around a second time.

func singleNonDuplicate(nums []int) int {
    seen := []int{}
    for _,v := range nums {
        contains := false
        for i := range seen {
            if seen[i] == v {
                contains = true
                seen = append(seen[:i], seen[i+1:]...)
                break
            }
        }        
        if !contains {
            seen = append(seen, v)
        }
    }
    return seen[0]
}

## Submission Details
### Runtime: 4 ms, faster than 99.41% of Go online submissions for Single Element in a Sorted Array.
### Memory Usage: 4.1 MB, less than 100.00% of Go online submissions for Single Element in a Sorted Array.


