---
title:  "Boredom-and-Leetcoding"
date:  "2020-11-29
"
categories: career programming
---
## [Number of Good Pairs](https://leetcode.com/problems/number-of-good-pairs)

## Difficulty
Easy

Hey viewer!  Hope you're having a fantastic day.  Today I decided to do some leetcoding again.

This was pretty easy, to be honest, but I'm just not feeling up to anything super challenging at the moment.

Very straightforward solution with a mild optimization to avoid going through n^2 pairs.

{% highlight java %}
class Solution {
    public int numIdenticalPairs(int[] nums) {
        int goodPairs = 0;
        for (int i = 0; i < nums.length; i++) {
            for (int j = i+1; j < nums.length; j++) {
                if (i != j && i < j && nums[i] == nums[j]) {
                    goodPairs++;
                }
            }
        }
        return goodPairs;
    }
}
{% endhighlight %}

## [Richest Customer Wealth](https://leetcode.com/problems/richest-customer-wealth/)

## Difficulty
Easy

Again, incredibly easy...

{% highlight java %}
class Solution {
    public int maximumWealth(int[][] accounts) {
        int highestAccount = 0;
        for (int i = 0; i < accounts.length; i++) {
            int accountTotal = 0;
            for (int j = 0; j < accounts[i].length; j++) {
                accountTotal += accounts[i][j];
            }
            if (accountTotal > highestAccount) {
                highestAccount = accountTotal;
            }
        }
        return highestAccount;
    }
}
{% endhighlight %}

## [Running Sum of 1d Array](https://leetcode.com/problems/running-sum-of-1d-array/)

## Difficulty
Easy

I know, I know...this is literally elementary, but I haven't solved this yet!  I'm just going through problems I haven't done before okay!

{% highlight java %}
class Solution {
    public int[] runningSum(int[] nums) {
        int[] runningSum = new int[nums.length];
        int sum = 0;
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            runningSum[i] = sum;
        }
        return runningSum;
    }
}
{% endhighlight %}

## [Check if Two String Arrays are Equivalent](https://leetcode.com/problems/check-if-two-string-arrays-are-equivalent)

## Difficulty
Easy

So, this one is actually a bit trickier. I'm sure there's an optimization to be made here, but I went with an obvious solution and it was actually fast enough to pass.  Let me know if you know of a better way to do this.  I was thinking about incrementally stepping through both arrays at the same time, but they may not have the same lengths so it could get weird...that's why I opted for a concise solution.

{% highlight java %}
class Solution {
    public boolean arrayStringsAreEqual(String[] word1, String[] word2) {
        StringBuilder sb = new StringBuilder();
        for (String x : word1) {
            sb.append(x);
        }
        
        StringBuilder sb2 = new StringBuilder();
        for (String y : word2) {
            sb2.append(y);
        }
        return sb.toString().equalsIgnoreCase(sb2.toString());
    }
}
{% endhighlight %}

## [Design Parking System](https://leetcode.com/problems/design-parking-system)

This one is pretty straightforward, although it's easy to do this in a really stupid way.

My submission is apparently faster than 99.73% of online submissions.

## Difficulty
Easy

{% highlight java %}
class ParkingSystem {
    
    int[] spots = new int[3];

    public ParkingSystem(int big, int medium, int small) {
        spots[0] = big;
        spots[1] = medium;
        spots[2] = small;
    }
    
    public boolean addCar(int carType) {
        if (carType == 1) {
            return updateSpots(0);
        } else if (carType == 2) {
            return updateSpots(1);
        } else {
            return updateSpots(2);
        }
        
    }
    
    public boolean updateSpots(int spotId) {
        if (spots[spotId] > 0) {
            spots[spotId]--;
            return true;
        }
        return false;
    }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * ParkingSystem obj = new ParkingSystem(big, medium, small);
 * boolean param_1 = obj.addCar(carType);
 */
{% endhighlight %}
