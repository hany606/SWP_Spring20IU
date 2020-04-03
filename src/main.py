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
def test():
    return jsonify({
        'ayaz' : 'loh'
    })

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
        print(new_presentation['id'])
        response_object['id'] = new_presentation['id']
        new_id = new_presentation['id']
        return response_object

@app.route('/edit/<id>', methods = ["GET", "POST"])
def url_edit(id):
    
    presentation = {}
    for p in presentations:
        if p['id'] == id:
            presentation = p

    response_object = {'status': 'success'}
    if request.method == 'GET':
        return jsonify(presentation)
    else:
        img = request.files['image']
        img_string = base64.b64encode(img.read())
        presentation['slides'].append(img_string)
        return response_object

if __name__ == "__main__":
    new_id = ''
    app.run(debug = True)
