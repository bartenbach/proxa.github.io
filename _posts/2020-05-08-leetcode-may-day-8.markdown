---
title:  "Leetcode May: Catch up! (1 through 8) Plus Cards"
date:   2020-05-08 08:27:17 -0500
categories: career programming
---
I had a day filled with coding.  I did eight leetcoding challenges for the May challenge (which I didn't know existed until today), and started on the binary search card.  Every single one of these is ranked *Easy*.

## [Binary Search](https://leetcode.com/problems/binary-search/)
This is pretty basic stuff.  I chose the recursive solution for binary search over the iterative solution. 
{% highlight go %}
func search(nums []int, target int) int {
    return searchRecursive(nums, target, 0, len(nums))
}

func searchRecursive(nums []int, target, begin, end int) int {
    if begin == end {
        return -1
    }
    midpoint := (begin + end) / 2 
    if target > nums[midpoint] {
        return searchRecursive(nums, target, midpoint+1, end) 
    } else if target < nums[midpoint] {
        return searchRecursive(nums, target, begin, midpoint)
    }
    return midpoint
}
{% endhighlight %}

As for the challenges, they're all pretty easy and self-explanatory.  One I thought was really interesting was the "bit shifting" problem.

## [First Bad Version](https://leetcode.com/problems/first-bad-version/)
This one I thought was really interesting because it says you can't brute force it, but it let me brute force it.  This is why I decided to do the Binary Search card.  Apparently, the challenge is supposed to fail you for brute forcing, and only approve binary searches - but I'm guessing Go is fast enough to where it couldn't detect that I just brute forced it :)
{% highlight go %}
/** 
 * Forward declaration of isBadVersion API.
 * @param   version   your guess about first bad version
 * @return 	 	      true if current version is bad 
 *			          false if current version is good
 * func isBadVersion(version int) bool;
 */

func firstBadVersion(n int) int {
    for i := 0; i <= n; i++ {
        if isBadVersion(i) {
            return i
        }  
    }
    return -1
}
{% endhighlight %}

## [Jewels and Stones](https://leetcode.com/problems/jewels-and-stones/)
This is a classic.  I've probably solved this 3 or 4 times before.  Probably the easiest programming challenge known to man.
{% highlight go %}
func numJewelsInStones(J string, S string) int {
    count := 0
    for _,i := range S {
        for _,j := range J {
            if i == j {
                count++
            }
        }
    }
    return count
}
{% endhighlight %}

## [Ransom Note](https://leetcode.com/problems/ransom-note/)
There's a bit of a gotcha if you don't use built-ins (which I tried not to, IE "contains" method), but this is still a 5 minute problem tops.
{% highlight go %}
func canConstruct(ransomNote string, magazine string) bool {
    for _,v := range ransomNote {
        replaced := false
        for _,r := range magazine {
            if r == v {
                magazine = strings.Replace(magazine, string(r), "", 1)
                replaced = true
                break
            }
        }
        if !replaced {
            return false
        }
    }
    return true
}
{% endhighlight %}

## [Number Complement](https://leetcode.com/problems/number-complement/)
From all the binary work I've done in college, I would have figured this would be simple.  You're just shifting the bits, how hard could it be?  Well, it's not extremely challenging, but it took some research into the bits package.  Note: This can also be done without the bits package, but it's not as clean.
{% highlight go %}
func findComplement(num int) int {
    return num ^ ((1 << bits.Len(uint(num))) - 1)
}
{% endhighlight %}

## [First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string/)
Again, not a hard problem so I decided to operate entirely on bytes and not use any built-ins.  Turned out to be an extremely performant solution, faster than 90% of other submissions.
{% highlight go %}
func firstUniqChar(s string) int {
    if len(s) == 1 {
        return 0
    }
    for i := 0; i < len(s); i++ {
        repeated := false
        current := s[i]
        for j := 0; j < len(s); j++ {
            if j == i {
                continue
            }
            if current == s[j] {
                repeated = true
                break
            }
        }
        if !repeated {
            return i
        }
    }
    return -1
}
{% endhighlight %}

## [Majority Element](https://leetcode.com/problems/majority-element/)
Another straightforward problem.  The intuitive solution uses a map and is O(n).
{% highlight go %}
func majorityElement(nums []int) int {
    intmap := make(map[int]int)
    for i := range nums {
        intmap[nums[i]]++
    }
    max := 0
    key := 0
    for i,v := range intmap {
        if v > max {
            max = v
            key = i
        }
    }
    return key
}
{% endhighlight %}

## [Check if it is a Straight Line](https://leetcode.com/problems/check-if-it-is-a-straight-line/)
I absolutely lost it during this problem.  This really should not be difficult, but Go refused to provide a float from integer division unless I casted literally every single element into a float64.  I find this is one of the things that irritates me about using Go as compared to Java.  I could really write an entire blog post at this point about things in Go that I've found that infuriate me.  Among this would be lack of generics and the interface implementation.
{% highlight go %}
func checkStraightLine(coordinates [][]int) bool {
    var slope float64 = float64((float64(coordinates[1][1]) - float64(coordinates[0][1]))) / float64((float64(coordinates[1][0]) - float64(coordinates[0][0])))
    for i := 1; i < len(coordinates) - 1; i++ {
        tmpSlope := float64((float64(coordinates[i+1][1]) - float64(coordinates[i][1]))) / float64((float64(coordinates[i+1][0]) - float64(coordinates[i][0])))
        if tmpSlope != slope {
            return false
        }
    }
    return true
}
{% endhighlight %}
