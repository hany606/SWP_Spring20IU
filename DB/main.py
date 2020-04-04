from utils import *
from img2gltf import Img2GLTF
import os
from PIL import Image


logging.basicConfig(filename='log.log',level=logging.DEBUG)


settings = get_settings()
client = init_mongodb(settings)
conv = Img2GLTF()


db_editor = client[settings["database"]["editor"]]
fs_editor = gridfs.GridFS(db_editor)
clean(db_editor,fs_editor)

db_app = client[settings["database"]["arapp"]]
fs_app = gridfs.GridFS(db_app)
clean(db_app,fs_app)




# ------------------------ Instead of the web editor -----------------------------
# Tmp instead of the editor: only made once
editor_imgs_path = "tmp_gen_editor_imgs/"
files = get_all_files(editor_imgs_path)
for i in files:
    store_file(fs_editor, editor_imgs_path+i, "tutorial1_"+i, flag="img")
# -----------------------------------------------------

# ------------------------------ This part should be activated with every insert from the editor ------------------

# Get the images from the editor collection
res = db_editor.fs.files.find()
# create a temporary directory
os.mkdir("tmp")
for r in res:
    file_name = r["filename"]
    # Get the image raw_data
    data = read_file(fs_editor, r["_id"])
    # Change it to image
    img = Image.open(BytesIO(data))
    # Save the image temporary in the tmp folder
    img.save("tmp/"+file_name)
    # Create Slide (.gltf, .bin) and save it in the tmp with .png
    conv.create_slide("tmp/",file_name[:-4])
    # store .bin .gltf .png into arapp collection 
    store_file(fs_app, "tmp/"+file_name[:-4]+".bin", file_name[:-4]+".bin")
    store_file(fs_app, "tmp/"+file_name[:-4]+".gltf", file_name[:-4]+".gltf")
    store_file(fs_app, "tmp/"+file_name, file_name)
    # Delete them from the tmp folder
    os.remove("tmp/"+file_name[:-4]+".bin")
    os.remove("tmp/"+file_name[:-4]+".gltf")
    os.remove("tmp/"+file_name)
os.rmdir("tmp/")


# -------------------------- Instead of the app -----------------------------
# Get the files of the tutorial1
res = db_app.fs.files.find()
for r in res:
    print(r)
    # Save them in tmp_tutorial_ret
    
# ---------------------------------------------------------------------------

# ---------------------------- Real ---------------------------
# Run grpc server

# Connect with the client from the app

# Wait till the app request from the server the tutorial


# client.drop_database(settings["database"])
client.close()
