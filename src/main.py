from flask import Flask, render_template, request
from pymongo import MongoClient
import json


app = Flask(__name__)
default_css = open(".\\stylesheets\\style.css", "r").read()

@app.route('/')
def url_index():
    buttons = {
        "Create tutorial" : "/create_tutorial",
    }
    return render_template('index.html', buttons = buttons, default_css = default_css)

@app.route('/create_tutorial', methods = ["POST", "GET"])
def url_create_tutorial():
    if request.method == "GET":
        return render_template("create_tutorial.html", default_css=default_css)

    text = request.form["text"]
    presentation = {"text": text}
    credentials = ''
    with open("credentials.txt", "r") as f:
        credentials = f.read()
    client = MongoClient(credentials)
    db = client.virtual_assistant
    db.presentations.insert_one({"sample presentation": presentation})
    return render_template("create_tutorial.html", default_css=default_css)

if __name__ == "__main__":
    app.run(debug = True)
