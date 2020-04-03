from gltflib import GLTF
import shutil
import json


def create_slide(out, uri):
    shutil.copyfile("Box.bin", out+uri+".bin")
    with open("Box.gltf","r") as read_file:
        data = json.load(read_file)
        data["nodes"][0]["name"] = uri
        data["buffers"][0]["uri"] = uri+".bin"
        data["images"][0]["uri"] = uri+".png"
        data["materials"][0]["name"] = uri
        data["meshes"][0]["name"] = uri
        with open(out+uri+".gltf","w+") as write_file:
            json.dump(data, write_file)

def create_tutorial(tutorial_path, num):
    for i in range(num):
        create_slide(tutorial_path,"Slide{:}".format(i))
        gltf = GLTF.load(tutorial_path+'Slide{:}.gltf'.format(i))
        gltf.export(tutorial_path+'Slide{:}.gltf'.format(i))

tutorial_path = "../tutorial1/"

create_tutorial(tutorial_path, 5)

# create_slide(tutorial_path, "SlideSample")
# gltf = GLTF.load(tutorial_path+'SlideSample.gltf')
# gltf.export(tutorial_path+'SlideSample.gltf')


