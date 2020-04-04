from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
import json
import uuid
import base64


DB_CREDENTIALS = ""

def db_connect(credentials):
    try:
        db = MongoClient("mongodb://" + credentials).virtual_assistant
        print("Successfully connected to the database")
        return db
    except Exception:
        print("Cannot connect to the database")
        return None

app = Flask(__name__)
CORS(app)

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
        cursor = db_connect(DB_CREDENTIALS)
        cursor.presentations.insert_one(pres)
        cursor.close()
        print("Presentation is saved to the database")
        return response_object

@app.route('/edit/<id>', methods = ["GET", "POST"])
def url_edit(id):
    cursor = db_connect(DB_CREDENTIALS)
    pres = dbclient.presentations.find({'id': id})
    cursor.close()
    
    if request.method == 'GET':
        return jsonify(pres)
    else:
        img = request.files['image']
        img_string = str(base64.b64encode(img.read()))[2:-1]
        print(type(img_string))
        pres['slides'].append(img_string)
        cursor = db_connect(DB_CREDENTIALS)
        cursor.presentations.update_one({'id': id}, pres)
        cursor.close()
        print("Presentation is updated and saved to the database")
        return jsonify(pres)

if __name__ == "__main__":
    with open("credentials.txt") as f:
        DB_CREDENTIALS = f.read()
    print("DB CREDENTIALS: ", DB_CREDENTIALS)
    app.run(host='0.0.0.0', debug = True)
