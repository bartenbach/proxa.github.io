#!/bin/bash
bundle install
[[ $? -eq 0 ]] || exit;
bundle exec jekyll serve --trace 
