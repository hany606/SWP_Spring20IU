from pymongo import MongoClient
import pymongo
import json
import gridfs
import logging
from os import walk

def get_settings(file_name="settings.json"):
    with open(file_name) as f:
        logging.debug('Get the settings.json')
        settings = json.load(f)
    return settings

def init_mongodb(settings):
    client = MongoClient("mongodb://{:}:{:}/".format(settings["host"],settings["port"]))
    logging.debug('MongoDB connection is initiated')
    return client

def store_file(fs, file_name):
    with open(file_name, "rb") as f:
        logging.debug('Reading the file: {:}'.format(file_name))
        data = f.read()
        logging.debug('Store the file data')
        stored_id = fs.put(data, filename=file_name)
        return stored_id


# https://stackoverflow.com/questions/27761674/retrieving-files-in-gridfs-to-be-sent-from-flask
def read_file(fs, file_id):
    logging.debug('Read the file data with id: {:} from the DB'.format(file_id))
    outputdata = fs.get(file_id).read()
    return outputdata


def remove_file(fs, file_id):
    logging.debug('Remove the file with id: {:} from the DB'.format(file_id))
    fs.delete(file_id)


def clean(db,fs):
    logging.debug("Remove all the files in the assets collection")
    res = db.fs.files.find()
    counter = 0
    for i in res:
        logging.debug("Remove file: {:}".format(i["filename"]))
        counter += 1
        remove_file(fs,i["_id"])
    # print(counter)

def get_all_files(path):
    logging.debug('Get the file names from the {:} directory'.format(path))
    f = []
    for (_, _, filenames) in walk(path):
        f.extend(filenames)
        break
    return f