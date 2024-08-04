#!/bin/bash

# Add navigation links to each HTML file
for file in templates/*.html; do
  echo "<nav><ul><li><a href='/'>Home</a></li><li><a href='/about'>About</a></li><li><a href='/contact'>Contact</a></li><li><a href='/faq'>FAQ</a></li></ul></nav>" > temp_nav
  cat $file >> temp_nav
  mv temp_nav $file
done
