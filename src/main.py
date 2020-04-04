from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
import json
import uuid
import base64


dbclient = None

app = Flask(__name__)
CORS(app)

#images are base64 encoded!

# @app.route('/', methods = ["GET"])
# def url_explore():
#     return jsonify(presentations)

@app.route('/create', methods = ["POST"])
def url_create(): 
    response_object = {'status': 'success', 'id': ''}
    if request.method == 'POST':
        new_presentation = {
            'id' : uuid.uuid4().hex,
            'title': 'Untitled',
            'slides' : []
        }
        response_object['id'] = new_presentation['id']
        dbclient.presentations.insert_one(new_presentation)
        print("Presentation is saved to the database")
        return response_object

@app.route('/edit/<id>', methods = ["GET", "POST"])
def url_edit(id):
    pres = dbclient.presentations.find({'id': id})
    # response_object = {'status': 'success'}
    if request.method == 'GET':
        return jsonify(pres)
    else:
        img = request.files['image']
        img_string = str(base64.b64encode(img.read()))[2:-1]
        print(type(img_string))
        pres['slides'].append(img_string)
        dbclient.presentations.insert_one(pres)
        print("Presentation is updated and saved to the database")
        return jsonify(pres)

if __name__ == "__main__":
    cred = ""
    with open("credentials.txt") as f:
        cred = f.read()
    try:
        dbclient = MongoClient("mongodb://" + cred)
        print("Successfully connected to the database")
    except Exception:
        print("Cannot connect to the database")
    app.run(host='0.0.0.0', debug = True)
