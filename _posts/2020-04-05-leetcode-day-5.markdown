---
title:  "Leetcode 30-Day Challenge: Day 5"
date:   2020-04-05 14:50:17 -0500
categories: career programming
---
# [Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)

Difficulty: Easy

Problem statement:

> Say you have an array for which the ith element is the price of a given stock on day i.
> 
> Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
> 
> Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).
> 
> Example 1:
> 
> Input: [7,1,5,3,6,4]
> Output: 7
> Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
>              Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
> Example 2:
> 
> Input: [1,2,3,4,5]
> Output: 4
> Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
>              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
>              engaging multiple transactions at the same time. You must sell before buying again.
> Example 3:
> 
> Input: [7,6,4,3,1]
> Output: 0
> Explanation: In this case, no transaction is done, i.e. max profit = 0.

Welp, here's where shit gets real folks.

After thinking about this problem for at least an hour, I had just about nothing.  I can think of no easy algorithm that could do this, so I did what a dumbfounded programmer does best - just start writing random code!

The first horrifying idea I came up with was this one:

{% highlight go %}  
func maxProfit(prices []int) int {
    attemptedBuys := len(prices)
    bestTransaction := -math.MaxInt32
    for attemptedBuys > 0 {
        buyTime, buyValue := findBuyTime(prices)
        sellTime, sellValue := findSellTime(prices, buyTime)
        fmt.Println(buyTime, " value: ", buyValue)
        fmt.Println(sellTime, " value: ", sellValue)
        if sellValue - buyValue > bestTransaction {
            bestTransaction = sellValue - buyValue
        }
        attemptedBuys--;
    }
    return bestTransaction
}

func findBuyTime(prices []int) (int, int) {
    minIndex := 0
    min := math.MaxInt32
    for i := 0; i < len(prices); i++ {
        if prices[i] < min {
            minIndex = i
            min = prices[i]
        }
    }
    return minIndex, min
}

func findSellTime(prices []int, buyTime int) (int, int) {
    maxIndex := 0
    max := -math.MaxInt32
    for i := buyTime; i < len(prices); i++ {
        if prices[i] > max {
            maxIndex = i
            max = prices[i]
        }
    }
    return maxIndex, max
}

func contains(array []int, value int) bool {
    for i := 0; i < len(array); i++ {
        if array[i] == value {
            return true
        }
    }
    return false
}
{% endhighlight %}

You can kind of see where I was going with this, but it definitely didn't work.  It didn't even pass the first test case.  I knew I was doing something horribly wrong, so I decided to start completely from scratch and come up with something different.  After a bit of head-braining, I came up with this:

{% highlight go %}  
func maxProfit(prices []int) int {
//fullArray := findBestSubarrayTransaction(prices)
    //buyMode := true
    fullProfit := 0
    for x := 0; x < 36; x++ {
        fullProfit += makeTransaction(prices)
    }
}

func makeTransaction(prices []int) {
    for i := 0; i < len(prices); i++ {
        value, index := makeBuy(prices, i)
        for j := 0; j < len(prices); j++ {
            total := makeSales(prices, i, value)
        }
        overallTotal += total
        // do it again with subarray prices[j:]
        return total += makeTransaction(prices[j:])
    }
}

func makeBuy(prices []int, currentIndex int) int {
    return prices[currentIndex]
}

func makeSale(prices []int, currentIndex int, value int) int {
    return prices[currentIndex] - value
}
{% endhighlight %}

Like my previous solution _this also fucking sucked._

These weren't anywhere *near* solving the problem.  I looked over at Mikayla and her IDE was filled with at least a hundred lines of Python code.  "Are you getting anywhere?"  "No" she replied.

At this point, I had to face facts.  This was an algorithmic problem.  No matter how much code we crank out, unless we understand how to best approach this problem, we're just wasting our time.

After mulling it over a bit longer, I eventually decided to cave - *I was going to look at the solution*.  I had to know what it was, and my worst fear would be that it was just painfully simple.  I clicked the solution tab, but nothing could prepare me for what I saw next...

{% highlight go %}  
func maxProfit(prices []int) int {
    profit := 0
    for i := 1; i < len(prices); i++ {
        if prices[i] > prices[i - 1] {
            profit += prices[i] - prices[i - 1]
        }
    }
    return profit
}
{% endhighlight %}

# _Un-fucking-believable_
We had spent two hours trying [insanely idiotic](https://www.youtube.com/watch?v=D4Ha_XjCuA8) algorithms and bashing our heads against the wall to be slapped in the face by a simple O(n) loop that just checks the next element.  *You've got to be fucking kidding me*.  Nope, not kidding you.  

We ran to the whiteboard to check some test cases and _sure as shit_ - checks out.

Realizing that we're fucking idiots, I decided to take this as a learning opportunity - because really that's what this contest should be all about anyway.  We never claimed to be the world's best programmers who knew the best algorithm to solve any problem (I mean I also didn't think we'd get stuck on day 5, but I digress).  So the take away is that we learned a new algorithm to solve certain types of problems.  I know I, for one, can say that I won't forget this one.
