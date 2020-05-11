from gltflib import GLTF
import shutil
import json

class Img2GLTF():
    def __init__(self, base_file="assets/"):
        self.base_file = base_file

    def create_slide(self, out, uri):
        shutil.copyfile(self.base_file+"Box.bin", out+uri+".bin")
        with open(self.base_file+"Box.gltf","r") as read_file:
            data = json.load(read_file)
            data["nodes"][0]["name"] = uri
            data["buffers"][0]["uri"] = uri+".bin"
            data["images"][0]["uri"] = uri+".png"
            data["materials"][0]["name"] = uri
            data["meshes"][0]["name"] = uri
            with open(out+uri+".gltf","w+") as write_file:
                json.dump(data, write_file)

    def create_tutorial(self, tutorial_path, num):
        for i in range(num):
            self.create_slide(tutorial_path,"Slide{:}".format(i))
            gltf = GLTF.load(tutorial_path+'Slide{:}.gltf'.format(i))
            gltf.export(tutorial_path+'Slide{:}.gltf'.format(i))


if __name__ == "__main__":
    conv = Img2GLTF()
    tutorial_path = "../tutorial1/"
    conv.create_tutorial(tutorial_path, 5)

