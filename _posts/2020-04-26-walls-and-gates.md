---
title:  "Leetcode: Walls and Gates"
date:   2020-04-26 08:27:17 -0500
categories: career programming
---
# [Walls and Gates](https://leetcode.com/explore/learn/card/queue-stack/231/practical-application-queue/1373/)

### Difficulty: Undefined

## Problem statement:

> You are given a m x n 2D grid initialized with these three possible values.  
>   
> 1. -1 - A wall or an obstacle.  
> 2. 0 - A gate.  
> 3. INF - Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.  
>   
> Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.   
>   
> Example:   
>   
> Given the 2D grid:  
>   
> `INF  -1   0   INF`  
> `INF  INF INF  -1`  
> `INF  -1  INF  -1`  
> `0    -1  INF  INF`
>     
> After running your function, the 2D grid should be:   
>      
> `3  -1   0   1`   
> `2   2   1  -1`   
> `1  -1   2  -1`   
> `0  -1   3   4`    

## Solution

#### Backstory
This wasn't a leetcode 30-day challenge question, but it's intimately related to a problem that's been keeping me awake at night since I started "leetcoding".

The problem this is related to - that I still haven't solved actually but should be able to now - is called *Rotting Oranges*.  It's also most likely the question that prevented me from getting a job offer at Amazon (couldn't figure out how to solve it in a timed interview).

Given that, I've been absolutely determined to figure it out.  _*Nay*_, not simply figure it out but to understand _why_ it works the way that it does.  In my quest to fill the hole of ignorance in my brain, I stumbled across a leetcode section on Queues and Breadth First Searching.  Given that the solution to this problem and Rotting Oranges both involve BFS and can be solved using a queue, I knew this was where I needed to start.

#### Solving The Problem
Given all that, this was not an easy concept for me to grasp.  Even after going through the "cards" in leetcode that supposedly explain to you how this works, I still didn't get it.  I asked Mikayla since she had done the same, and she didn't get it either.  Feeling rather stupid, I had written a few lines of code already, but my gut feeling was telling me that I was probably solving the problem in a really naive and stupid way, so I opened up the solution.  They had exactly what I was trying to do, written in Java, along with the words "Brute Force (Time Limit Exceeded).  
I knew it.  I was going to spend an hour coding a solution that was slow and didn't even pass.  Instead of feeling let down, I decided to read on - I needed to understand how this was supposed to work...

I scrolled down to find another solution with the words "Accepted"
> Instead of searching from an empty room to the gates, how about searching the other way round? In other words, we initiate breadth-first search (BFS) from all gates at the same time.

When I read that sentence, it blew my mind.  What a simple idea.  I spent about a half hour reading through the Java implementation and struggling to understand the solution until I had completely grasped all the pieces and parts.

Then, it was time for the moment of truth.  Could I take what I had learned and write a Go solution from scratch?  Yes I could and yes I did.  My solution is as follows:

 {% highlight go %}
const GATE = 0
const EMPTY = math.MaxInt32
const WALL = -1
var directions = []coord{
    coord{ 1, 0 },
    coord{ -1, 0 },
    coord{ 0, 1 },
    coord{ 0, -1 },
}

type coord struct {
    x int
    y int
}

func wallsAndGates(rooms [][]int) {
    if len(rooms) == 0 {
        return
    }
    queue := []coord{}

    // Go through all rooms and only add the gates to the queue.  They'll trigger a BFS.
    for i := 0; i < len(rooms); i++ {
        for j := 0; j < len(rooms[i]); j++ {
            if rooms[i][j] == GATE {
                queue = append(queue, coord{ i, j})
            }
        }
    }

    // While we have more nodes to process
    for len(queue) > 0 {
        // dequeue a node
        currentGate := queue[0]
        currentX := currentGate.x
        currentY := currentGate.y
        queue = queue[1:]
        // Try to look in every direction: up, down, left, right for an empty roo
        for _,v := range directions {
            x := currentX + v.x
            y := currentY + v.y
            // if the node we are trying to look at is out of bounds or is a WALL, give up
            if x < 0 || x >= len(rooms) || y < 0 || y >= len(rooms[0]) || rooms[x][y] != EMPTY {
                continue       
            }
            // since the node is a valid empty room, mark it with the current distance from the gate
            // also, add it to the queue so we can process it and continue the BFS
            rooms[x][y] = rooms[currentX][currentY] + 1
            queue = append(queue, coord{x, y})
        }
    }
}
{% endhighlight %}

It may not seem like much, but I REALLY struggled to understand this concept.  Although the breadth first search seems intuitive and obvious, implementing a solution with a queue for any practical search application was just totally escaping me.

I can confidently say I totally understand how this works now though, and that feels good.

### Solution Details
Runtime: 32ms
Memory Usage: 7MB
