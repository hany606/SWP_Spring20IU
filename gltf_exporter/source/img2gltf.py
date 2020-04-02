from gltflib import GLTF
import shutil
import json


def create_slide(uri):
    shutil.copyfile("Plane.bin", uri+".bin")
    with open("Plane.gltf","r") as read_file:
        data = json.load(read_file)
        data["nodes"][0]["name"] = uri
        data["buffers"][0]["uri"] = uri+".bin"
        data["images"][0]["uri"] = uri+".png"
        data["materials"][0]["name"] = uri
        data["meshes"][0]["name"] = uri
        with open(uri+".gltf","w+") as write_file:
            json.dump(data, write_file)

out_path = "../tutorial1/"

create_slide(out_path+"SlideSample")
gltf = GLTF.load(out_path+'SlideSample.gltf')
gltf.export(out_path+'SlideSample.gltf')
