from base64 import b64encode

def get_tutorials():
    # TODO: get list of tutorial just info from DB

    tutorials = [
        {"name": "tutorial1", "length": 5, "_id": "56165165"},
        {"name": "tutorial2", "length": 10, "_id": "23186166"},
        {"name": "tutorial3", "length": 1, "_id": "51681321"},
        {"name": "tutorial4", "length": 2, "_id": "89453218"}
    ]
    return tutorials

def get_tutorial(idx):
    # TODO get tutorial content from the db
    tutorials = [
        {"name": "tutorial1", "length": 5, "_id": "56165165"},
        {"name": "tutorial2", "length": 10, "_id": "23186166"},
        {"name": "tutorial3", "length": 1, "_id": "51681321"},
        {"name": "tutorial4", "length": 1, "_id": "89453218"}
    ]
    tutorial = tutorials[idx]
    tutorial["slides"] = []
    for i in range(tutorial["length"]):
        with open("Slide0.bin", "rb") as f:
            bindata = f.read()
        with open("Slide0.gltf", "rb") as f:
            gltfdata = f.read()
        imgdata = b64encode(open("Slide0.png", "rb").read())
        slide = {"image": imgdata, "bin": bindata, "gltf": gltfdata}
        tutorial["slides"].append(slide)

    return tutorial