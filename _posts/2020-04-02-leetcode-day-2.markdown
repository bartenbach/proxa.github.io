---
title:  "Leetcode 30-Day Challenge: Day 2"
date:   2020-04-02 17:50:17 -0500
categories: career programming
---
So here's the problem statement:

> Write an algorithm to determine if a number is "happy".
> A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

I first attempted to solve this one in Go, but got frustrated rather quickly.

I know, I know, I can already hear you.  "Are you freaking kidding me dude?  You lasted one day with Go!"  Yeah, well I'm 
still open to using Go for a lot of things, but right now I just wanted to get this thing solved and I knew exactly how to do it 
with Java.  I couldn't for the life of me figure out how to *split an integer into digits* using Go.  I wasted probably 15-20 minutes 
trying to figure this out until just going back to good old Java.  Once I did, the solution manifested itself pretty quickly. 

{% highlight java %}  
class Solution {

    public boolean isHappy(int n) {
        List<Integer> encountered = new ArrayList<Integer>();

        while (!encountered.contains(n)) {
            encountered.add(n);
            int[] digits = getDigits(String.valueOf(n).toCharArray());

            int sum = 0;
            for (int i = 0; i < digits.length; i++) {
                sum += Math.pow(digits[i],2);
            }

            if (sum == 1) {
                return true;
            }
            n = sum;
        }
        return false;
    }

    public int[] getDigits(char[] characters) {
        int[] digits = new int[characters.length];
        for (int i = 0; i < digits.length; i++) {
            digits[i] = Integer.parseInt(String.valueOf(characters[i]));
        }
        return digits;
    }
}
{% endhighlight %}
