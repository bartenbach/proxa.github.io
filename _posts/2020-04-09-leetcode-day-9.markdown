---
title:  "Leetcode 30-Day Challenge: Day 9"
date:   2020-04-09 18:50:17 -0500
categories: career programming
---
# [Backspace String Compare](https://leetcode.com/problems/backspace-string-compare/)

Difficulty: Easy

Problem statement:

> Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.  
>   
> Example 1:  
>   
> Input: S = "ab#c", T = "ad#c"  
> Output: true  
> Explanation: Both S and T become "ac".  
> Example 2:  
>   
> Input: S = "ab##", T = "c#d#"  
> Output: true  
> Explanation: Both S and T become "".  

Again, pretty easy problem.  I realized right away that this could be solved using a stack.

Figuring out how to do this in Go took me a bit of time, especially understanding how "Runes" work.

This solution's time complexity is O(n) and the space complexity is O(1).

{% highlight go %}
func backspaceCompare(S string, T string) bool {
    return parseString(S) == parseString(T)
}

func parseString(input string) string {
    stringSlice := []rune{ }
    for i := 0; i < len(input); i++ {
        if rune(input[i]) == '#' {
            if len(stringSlice) > 0 {
                stringSlice = stringSlice[0:len(stringSlice)-1]
            }
        } else {
            stringSlice = append(stringSlice, rune(input[i]))
        }
    }
    return string(stringSlice)
}
{% endhighlight %}
