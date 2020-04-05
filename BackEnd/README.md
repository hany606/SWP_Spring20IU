# DB

The database is based on MongoDB. Python is used for the Backend.

The DB consists of 3 collections:

1. assets: contains the assets that we put in the DB that are necessary for process in the server (e.g. exporting images to gltf), it requires gltf file and bin file as base for the format.   Instead, these files could be in the local VM in the backend

2. editor: contins the images that being made from the editor and saved there

3. arapp: contains the tutorials that output from the gltf_exporter module that take source from the assets collection and the images from the editor collection and store the result in gltf_exporter