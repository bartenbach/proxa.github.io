---
title:  "Ruby Post Generator"
date:  "2020-05-16
"
categories: career programming
---

It's been getting really old copying the same file and replacing all the fields every time I want to make a new blog post.

Don't get me wrong - Jekyll is great.  I love my lightweight site and I really feel like it's totally sustainable.  I just needed a better way to start new posts - some sort of template.

I originally started writing something in bash, but I just got frustrated with how lacking bash can be in functionality.

{% highlight bash %}
#!/bin/bash

POST_DATE=$(date "+%Y-%m-%d")
POST_FILE_EXTENSION=".markdown"

echo "Enter post title: "
read INPUT

# replace whitespace with dashes for the filename
POST_TITLE=$(echo $INPUT | sed "s/ /-/g")

FULL_TITLE="${POST_DATE}-${POST_TITLE}${POST_FILE_EXTENSION}"
{% endhighlight %}

I got to the point where I needed to do a search and replace in a string for the filename, and after some reading I realized I had to pipe the string to sed in order to do it.

At that point, I realized what I probably needed was a scripting language, so I decided to give Ruby a shot.

{% highlight ruby %}
#!/usr/bin/ruby

require 'fileutils'

POST_DATE = `date "+%Y-%m-%d"`
POST_FILE_EXTENSION = ".markdown"
POST_DIRECTORY = "_posts"
TEMPLATE_FILENAME = "template.markdown"
TITLE_MARKER = "@TITLE@"
DATE_MARKER = "@DATE@"

puts "Enter post title: "
post_title = gets.chomp

# Create new filename and copy template over
post_title.gsub! " ", "-"
post_filename = POST_DATE.strip + "-" + post_title + POST_FILE_EXTENSION
post_path = File.join(POST_DIRECTORY, post_filename)
FileUtils.cp TEMPLATE_FILENAME, post_path

# replace variables in template file
template = File.read(post_path)
title_replaced = template.gsub(TITLE_MARKER, post_title)
date_replaced = title_replaced.gsub(DATE_MARKER, POST_DATE)

# write file
File.open(post_path, "w") do |f|
  f.write(date_replaced)
end

# open post for editing
system('vim', post_path)
{% endhighlight %}

This works pretty well.  It doesn't do a whole lot, but it does automate a manual process that was starting to make me less likely to write blog posts.  I started 
dreading the manual step of copying over an old post and updating all the variables.  Now I just run this script and it copies over the template, searches and replaces 
the variables, and opens it up in an editor on the command line for me to start writing.  It's small, quick, and easy to maintain. I love it!

I might add a few more lines to polish it up as I continue using it, but for the most part it's really all I need.
