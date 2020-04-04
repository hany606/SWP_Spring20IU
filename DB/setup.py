from utils import *
import logging


if __name__ == "__main__":
    settings = get_settings()
    client = init_mongodb(settings)

    db = client[settings["database"]["assets"]]
    fs = gridfs.GridFS(db)

    clean(db,fs)

    assets_path = "assets/"
    files = get_all_files(assets_path)

    # print(f)
    logging.debug('Store all the files from the assets directory')
    for i in files:
        store_file(fs, assets_path+i)

    client.close()
