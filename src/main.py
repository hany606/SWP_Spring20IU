from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
import json
import uuid
import base64


DB_CREDENTIALS = ""

def db_connect(credentials):
    try:
        db = MongoClient("mongodb://" + credentials[:-1])
        return db.virtual_assistant
    except Exception:
        print("Cannot connect to the database")
        return None

app = Flask(__name__)
CORS(app)
#images are base64 encoded!

#NEED TO MAKE TO WORK WITH DB
@app.route('/', methods = ["GET"])
def url_explore():
    return jsonify(presentations)


@app.route('/create', methods = ["POST"])
def url_create(): 
    response_object = {'status': 'success', 'id': ''}
    if request.method == 'POST':
        pres = {
            'id' : uuid.uuid4().hex,
            'title': 'Untitled',
            'slides' : []
        }
        response_object['id'] = pres['id']
        db = db_connect(DB_CREDENTIALS)
        db.presentations.insert_one(pres)
        print("Presentation is saved to the database")
        return response_object

@app.route('/edit/<id>/<index>', methods = ["GET", "POST"])
def url_edit(id, index):
    db = db_connect(DB_CREDENTIALS)
    pres = db.presentations.find_one({'id': id})
    pres.pop('_id')

    if request.method == 'GET':
        return jsonify(pres)
    else:
        try:
            ##ADD DB HERE
            title = request.form['title']
            pres['title'] = title
        except KeyError: 
            img = request.files['image']
            img_string = str(base64.b64encode(img.read()))[2:-1]
            pres['slides'][int(index)] = img_string
            db = db_connect(DB_CREDENTIALS)
            db.presentations.update_one({'id': id}, {'$set': {'slides': pres['slides']}})
        print("Presentation is updated and saved to the database")
        return jsonify(pres)

@app.route('/add_slide/<id>', methods = ["GET", "POST"])
def url_add_slide(id):
    db = db_connect(DB_CREDENTIALS)
    pres = db.presentations.find_one({'id': id})
    pres.pop('_id')

    if request.method == 'GET':
        return jsonify(pres)
    else:
        pres['slides'].append("")
        db = db_connect(DB_CREDENTIALS)
        db.presentations.update_one({'id': id}, {'$set': {'slides': pres['slides']}})
        print("Presentation is updated and saved to the database")
        return jsonify(pres)

if __name__ == "__main__":
    with open("credentials.txt") as f:
        DB_CREDENTIALS = f.read()
    print("DB CREDENTIALS: ", DB_CREDENTIALS)
    app.run(host='0.0.0.0', debug = True)
