#!/bin/bash

# Ask for pages to create
echo "Enter page names (separated by spaces): "
read page_names

# Loop through page names
for page_name in $page_names; do
  # Create HTML file
  echo "<!DOCTYPE html><html><head><title>$page_name</title><link rel='stylesheet' href='{{ url_for('static', filename='styles.css') }}'></head><body><h1>$page_name</h1></body></html>" > templates/$page_name.html
  
  # Create route in app.py
  echo "@app.route('/$page_name')" >> app.py
  echo "def $page_name():" >> app.py
  echo "    return render_template('$page_name.html')" >> app.py
done
