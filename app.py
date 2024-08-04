from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/shine")
def shine():
    return "Shine on!"

if __name__ == "__main__":
    app.run(debug=True)@app.route('/about')
def about():
    return render_template('about.html')
@app.route('/about')
def about():
    return render_template('about.html')
@app.route('/contact')
def contact():
    return render_template('contact.html')
@app.route('/faq')
def faq():
    return render_template('faq.html')