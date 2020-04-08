---
title:  "Leetcode 30-Day Challenge: Day 6"
date:   2020-04-06 14:50:17 -0500
categories: career programming
---
# [Group Anagrams](https://leetcode.com/problems/group-anagrams/)

Difficulty: Medium

Problem statement:

> Given an array of strings, group anagrams together.
> 
> Example:
> 
> Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
> Output:
> [
>   ["ate","eat","tea"],
>   ["nat","tan"],
>   ["bat"]
> ]
> Note:
> 
> All inputs will be in lowercase.
> The order of your output does not matter. 

I looked at today's problem and thought to myself "heh, that's cute". Well...I had forgotten one important detail.  In _java_ this might have been a cute little exercise - but I wasn't using java.  Oh no, I had decided to use *Go* - a language in which I knew nothing about.

Fortunately, I was able to solve this entirely without cheating.  However, it took at least an hour of research and repeatedly googling "how to do X golang".

All said and done, my solution initally was too slow to pass the last "performance" test case.  I sped it up by removing some redundant logic in the last funciton.

{% highlight go %}
func groupAnagrams(strs []string) [][]string {
    anagramList := [][]string{}
    firstList := []string{ strs[0] }
    anagramList = append(anagramList, firstList)
    for i:= 1; i < len(strs); i++ {
        anagramList = checkAnagramListForMatch(anagramList, strs[i])
    }
    return anagramList
}

func checkAnagramListForMatch(anagramList [][]string, v string) [][]string {
    for i := range anagramList {
        word := anagramList[i][0]
        if isAnagram(word, v) {
            anagramList[i] = append(anagramList[i], v)
            return anagramList
        }
    }
    anagramList = append(anagramList, []string { string(v) })
    return anagramList
}

func isAnagram(word string, word2 string) bool {
    if len(word) != len(word2) {
        return false
    }
    for _,v := range word2 {
        word = strings.Replace(word, string(v), "", 1)
    }
    return len(word) == 0
}
{% endhighlight %}
