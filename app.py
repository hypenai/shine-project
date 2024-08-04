from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/shine")
def shine():
    return "Shine on!"

# Add any additional routes or code from the remote version here
