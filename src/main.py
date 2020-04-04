from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
from PIL import Image
import json
import uuid
import base64


app = Flask(__name__)

CORS(app)

presentations = []

new_id = '' 
#images are base64 encoded!

@app.route('/', methods = ["GET"])
def url_explore():
    return jsonify(presentations)

@app.route('/create', methods = ["POST"])
def url_create(): 
    response_object = {'status': 'success', 'id': ''}
    if request.method == 'POST':
        new_presentation = {
            'id' : uuid.uuid4().hex,
            'title': 'Untitled',
            'slides' : []
        }
        presentations.append(new_presentation)
        response_object['id'] = new_presentation['id']
        return response_object

@app.route('/edit/<id>', methods = ["GET", "POST"])
def url_edit(id):
    current_presentation = {}
    for p in presentations:
        if p['id'] == id:
            current_presentation = p

    response_object = {'status': 'success'}
    if request.method == 'GET':
        return jsonify(current_presentation)
    else:
        img = request.files['image']
        img_string = str(base64.b64encode(img.read()))[2:-1]
        print(type(img_string))
        current_presentation['slides'].append(img_string)
        return jsonify(current_presentation)

if __name__ == "__main__":
    new_id = ''
    app.run(host='0.0.0.0', debug = True)
