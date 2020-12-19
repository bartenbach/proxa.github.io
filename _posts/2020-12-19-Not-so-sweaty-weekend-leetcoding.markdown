---
title:  "Not-so-sweaty-weekend-leetcoding"
date:  "2020-12-19
"
categories: career programming
---
Hello, world!  I hope you're doing good.  Time for some more leetcode challenges!

## [https://leetcode.com/problems/goal-parser-interpretation](Goal Parser Interpretation)

## Difficulty
Easy

This is basically just string manipulation 101.  I don't know what else to say.  There's no wizardry here.

{% highlight java %}
class Solution {
    public String interpret(String command) {
        StringBuilder sb = new StringBuilder();
        while (command != "") {
            command = parseCommand(sb, command);
        }
        return sb.toString();
    }

    public String parseCommand(StringBuilder sb, String command) {
        if (command.startsWith("G")) {
            sb.append("G");
            return command.substring(1);
        } else if (command.startsWith("()")) {
            sb.append("o");
            return command.substring(2);
        } else if (command.startsWith("(al)")) {
            sb.append("al");
            return command.substring(4);
        }
        return "";
    }
}
{% endhighlight %}

## Submission Details
### Runtime: 0**ms** faster than 100.00% of Java online submissions

Other than that, I've started doing the MySQL challenges which are definitely harder than they lead you to believe.  What's insulting is that leetcode proclaims them to be the easiest problems they have.  Well, that's a load of shit.  I know my way around basic SQL no sweat but I've had to Google SQL functions for almost every single one of these.
