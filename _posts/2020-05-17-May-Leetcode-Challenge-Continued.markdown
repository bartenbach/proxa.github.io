---
title:  "May-Leetcode-Challenge-Continued"
date:  "2020-05-17
"
categories: career programming
---
## []()

## Difficulty

This utilized the hint they gave, but without using any data structure.  It is possible to 
complete this code to arrive at a solution, but i doubt it would be pretty.
{% highlight go %}
func removeKdigits(num string, k int) string {
    counter := 0
    bytes := []byte(num)

    if len(num) == k {
        return "0"
    }

    for i := 0; i < len(bytes) - 1; i++ {
        // if we have removed the maximum number of digits, stop
        if counter == k {
            break
        }

        // convert string data into digits for comparison
        left, err := strconv.Atoi(string(bytes[i]))
        right, err2 := strconv.Atoi(string(bytes[i+1]))
        if err != nil || err2 != nil {
            panic("Received non-integer input!")
        }

        // compare left to right digit.  if left is larger, remove it.
        if left > right {
            fmt.Println("remove: ", left)
            bytes = append(bytes[:i], bytes[i+1:]...)
            counter++
            i-=1
        }
    }
//    for counter < k {
 //       for j := len(bytes) - 1; j > -1; j-- {
  //          if bytes[j] != 48 && counter < k {
                //fmt.Println("removing ", string(bytes[j]))
   //             bytes = append(bytes[:j], bytes[j+1:]...)
    //            counter++
     //       }
      //  }
   // }
    for counter < k {
        bytes = bytes[:len(bytes)-1]
        counter++
    }

    // remove all leading zeroes if they exist
    for len(bytes) > 1 && bytes[0] == 48 {
            bytes = bytes[1:]
    }

    return string(bytes)
}
{% endhighlight %}

{% highlight go %}
func removeKdigits(num string, k int) string {
    removed := 0
    stack := []int{}
   
    // if we are to remove all digits, the answer will always be zero
    if len(num) == k {
        return "0" 
    }
  
    // push the first digit to the stack
    first, err := strconv.Atoi(string(num[0]))
    if err != nil {
        panic("Non-integer input!")
    }
    stack = append(stack, first)
    
    for i := 1; i < len(num); i++ {
        right, err := strconv.Atoi(string(num[i]))
       
        if right == 0 && k == len(num) - 1 {
            return "0"
        }
        
        // if we have removed the maximum number of digits, stop
        if removed == k {
            stack = append(stack, right)
            continue
        }
        
        // convert string data into digits for comparison
        left := stack[len(stack) - 1]
        fmt.Println("Comparing ", left, " to ", right)
        if err != nil {
            panic("Received non-integer input!")
        }
        
        // compare left to right digit.  if left is larger, remove it.
        if left > right {
            fmt.Println("remove: ", left)
            stack = stack[:len(stack) - 1]
            stack = append(stack, right)
            removed++
        } else {
            stack = append(stack, right)
        }
    }

    // remove all leading zeroes
    for len(stack) > 1 && stack[0] == 0 {
        stack = stack[1:]   
    }
    fmt.Println(stack) 
    // remove all additional numbers not accounted for by algorithm 
    for removed < k {
        stack = stack[:len(stack) - 1]
        removed++
    }
        
    
    // convert stack to string
    ans := ""
    for i := 0; i < len(stack); i++ {
        ans += strconv.Itoa(stack[i])   
    }
    
    return ans 
}
{% endhighlight %}

## Submission Details
### Runtime: **ms**
### Memory Usage: **MB**
