from flask import Flask, render_template, request
import argparse

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/execute', methods=['POST'])
def execute():
    command = request.form['command']
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='command')

    hello_parser = subparsers.add_parser('hello')
    hello_parser.add_argument('--name', required=True)

    args = parser.parse_args(command.split())

    if args.command == 'hello':
        return f'Hello, {args.name}!'

    return 'Command not found!'

if __name__ == '__main__':
    app.run(debug=True)
