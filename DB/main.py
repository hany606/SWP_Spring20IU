from utils import *
from img2gltf import Img2GLTF

logging.basicConfig(filename='log.log',level=logging.DEBUG)


settings = get_settings()
client = init_mongodb(settings)


# -----------------------------------------------------
# Tmp instead of the editor: only made once
db_editor = client[settings["database"]["editor"]]
fs_editor = gridfs.GridFS(db_editor)

clean(db_editor,fs_editor)

editor_imgs_path = "tmp_gen_editor_imgs/"
files = get_all_files(editor_imgs_path)
for i in files:
    store_file(fs_editor, editor_imgs_path+i)
# -----------------------------------------------------


# Get the images from the editor collection


    # Save them temporary in the tmp folder (one by one)
    
    # Create Slide and save it in the tmp

    # Load .bin .gltf .png into arapp collection

    # Delete it from the tmp folder


# -------------------------- Instead of the app -----------------------------
db_app = client[settings["database"]["arapp"]]
fs_app = gridfs.GridFS(db_app)

# Get the files of the tutorial1


    # Save them in tmp_tutorial_ret

# ---------------------------------------------------------------------------

# ---------------------------- Real ---------------------------
# Run grpc server

# Connect with the client from the app

# Wait till the app request from the server the tutorial


# client.drop_database(settings["database"])
client.close()
