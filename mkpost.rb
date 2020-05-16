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
