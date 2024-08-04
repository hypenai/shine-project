#!/bin/bash

# Create a new HTML page
echo "Enter page name (without extension): "
read page_name

# Create HTML file
echo "<!DOCTYPE html><html><head><title>$page_name</title><link rel='stylesheet' href='{{ url_for('static', filename='styles.css') }}'></head><body><h1>$page_name</h1></body></html>" > templates/$page_name.html

# Create route in app.py
echo "@app.route('/$page_name')" >> app.py
echo "def $page_name():" >> app.py
echo "    return render_template('$page_name.html')" >> app.py

# Create static folder if it doesn't exist
if [ ! -d "static" ]; then
  mkdir static
fi

# Create styles.css if it doesn't exist
if [ ! -f "static/styles.css" ]; then
  touch static/styles.css
fi

# Add CSS to styles.css
echo "body { background-color: #f2f2f2; font-family: Arial, sans-serif; }" >> static/styles.css
echo "h1 { color: #00698f; }" >> static/styles.css

# Create templates folder if it doesn't exist
if [ ! -d "templates" ]; then
  mkdir templates
fi

# Run Flask app
python app.py

# Open web browser
start http://127.0.0.1:5000/$page_name

# Create new JavaScript file
echo "Enter JavaScript file name (without extension): "
read js_name
touch static/$js_name.js

# Add JavaScript code to new file
echo "console.log('Hello from $js_name.js!')" >> static/$js_name.js