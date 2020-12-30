---
title:  "Rotting-Oranges!"
date:  "2020-12-30
"
categories: career programming
---
Welp, here it is folks!  I finally sat down and faced my nightmare.  The question Amazon gave me during the interview that I 
basically blew (Well, it actually passed about half of the unit tests, but god knows how it even did that.  The code was terrible 
and had a lot of issues).  The first coding question they gave me was Number of Islands which I've probably solved on this blog? 
If I haven't, it's pretty easy.  THIS one, however, is a bit more tricky.  It's definitely not elite-level hacker hard, but there 
are some subtle things you have to be aware of if you want to solve this problem.

I chose Java.  Why?  Because I hate myself.  No, but seriously, that's almost all I do at work these days, so it just felt easier. 
Could you do this faster in other languages?  Yes, of course.  Could you do it faster in Java?  Absolutely, but I'm not really interested 
in optimizing a toy problem when the code I have solves it quickly enough and is incredibly easy to understand.  You could minimize the
 lines a bit as well, but I'm just going to leave this one as is.

Anyway, enough preface, on to the solution!

## [Rotting Oranges](https://leetcode.com/problems/rotting-oranges/)

## Difficulty
Medium

{% highlight java %}
class Solution {
    public int orangesRotting(int[][] grid) {
        OrangeManager orangeManager = new OrangeManager(grid);
        int minutes = 0;
        boolean changed = true;
        while (changed && orangeManager.getFresh().size() > 0) {
            changed = rotNearbyOranges(orangeManager);
            minutes++;
        }
        return orangeManager.getFresh().size() > 0 ? -1 : minutes;
    }
    
    public boolean rotNearbyOranges(OrangeManager orangeManager) {
        boolean changed = false;
        // needed to prevent ConcurrentModification Exception
        List<Coord> newlyRottenOranges = new ArrayList<>();
        for (Coord rotten : orangeManager.getRotten()) {
            Coord north = new Coord(rotten.row + 1, rotten.col);
            Coord south = new Coord(rotten.row - 1, rotten.col);
            Coord east = new Coord(rotten.row, rotten.col + 1);
            Coord west = new Coord(rotten.row, rotten.col - 1);
            Coord[] coords = new Coord[]{ north, south, east, west };
            for (Coord direction : coords) {
                if (orangeManager.getFresh().contains(direction)) {
                    orangeManager.getFresh().remove(direction);
                    newlyRottenOranges.add(direction);
                    changed = true;
                }
            }
        }
        orangeManager.getRotten().addAll(newlyRottenOranges);
        return changed;
    }
}

class OrangeManager {
    private Queue<Coord> rotten;
    private Queue<Coord> fresh;
    
    public OrangeManager(int[][] grid) {
        this.rotten = new ArrayDeque<>();
        this.fresh = new ArrayDeque<>();
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                switch(grid[i][j]) {
                    case 1:
                        this.fresh.add(new Coord(i,j));
                        break;
                    case 2:
                        this.rotten.add(new Coord(i,j));
                        break;
                    default:
                        // no orange
                        break;
                }
            }
        }
    }
    
    public Queue<Coord> getRotten() {
        return this.rotten;
    }
    
    public Queue<Coord> getFresh() {
        return this.fresh;
    }
}

class Coord {
    int row;
    int col;
    
    public Coord(int row, int col) {
        this.row = row;
        this.col = col;
    }
    
    @Override
    public boolean equals(Object o) {
        if (o == null || !(o instanceof Coord)) {
            return false;
        }
        Coord coord = (Coord) o;
        return this.row == coord.row 
            && this.col == coord.col;
    }
    
    @Override
    public String toString() {
        return "[" + this.row + "," + this.col + "]";
    }
}
{% endhighlight %}

## Submission Details
### Runtime: **7 ms**
### Memory Usage: **38.1 MB**
