---
title:  "Things Are Looking Up"
date:   2020-04-01 17:50:17 -0500
categories: career programming
---
I think making the transistion onto the management track was a good move.  I've learned a lot, but one other unexpected byproduct 
was that my passion for computer science was reignited.

Some things I've been doing recently:
* leetcode: https://leetcode.com (16 / 1397 solved)
* project euler: https://projecteuler.net (10 / 708 solved)

A part of me wants to make progress bars to track my progress, but that is exactly the kind of thing that caused me so much grief 
about my last website.  When my personal website turns into a 'web design career' then my passion gets completely sucked out and it 
turns into more of a job. I don't want this website to be a job.  I want this website to be something _very_ simple that I can 
quickly type up a post, push it to version control, and get it deployed.  Simple, fast, and lightweight.  

I know it's not the most pretty or fancy website, but it was designed 100% by me, it's easy to maintain, and sustainable.

Anyway, that was a bit of an aside...

I'll try to update my progress as I finish more of these programming challenges.  If you're doing this as well, please reach 
out to me so we can talk about our progress!

One thing that literally just went live today was the leetcode 30-day challenge: https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/

With work and school, I can't really promise that I'll make it through this - but so far I'm 1/30 because I've already finished today's challenge in Go.  I've decided that I'm going to attempt to use Go for the entire series.  There was a lot of cursing involved, but I ended up getting it done with the following solution:

```go
func singleNumber(nums []int) int {
    intMap := make(map[int]bool)
    for _,v := range nums {
        if intMap[v] == false {
            intMap[v] = true
        } else {
            delete(intMap, v)
        }
    }
    for key := range intMap {
        return key
    }
    return 0
}
```

This solution is O(n) and although not intuitive, meets the requirements.  I'm open to seeing solutions from others, so let me know.

More to come.
