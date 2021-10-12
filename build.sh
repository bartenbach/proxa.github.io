#!/bin/bash
bundle install
[[ $? -eq 0 ]] || exit;
bundle exec jekyll serve &
sleep 2
open http://localhost:4000
