from pygltflib import GLTF2
from pygltflib.utils import ImageFormat, Image
gltf = GLTF2().load("box.gltf")
image = Image()
image.uri = "sample.png"
gltf.images.append(image)
gltf.convert_images("png")
gltf.images[0].uri  # will now be something like "data:image/png;base64,iVBORw0KGg..."
gltf.images[0].name  # will be myfile.png

gltf.save("Sample.gltf")