import grpc
from base64 import b64decode

# import the generated classes
import displayer_pb2
import displayer_pb2_grpc

# open a gRPC channel
channel = grpc.insecure_channel('localhost:50051')

# create a stub (client)
stub = displayer_pb2_grpc.HelperStub(channel)

# create a valid request message
empty = displayer_pb2.Empty()

# make the call
response = stub.GetTutorialsList(empty)

# et voilà
print(response.length)
for i in response.tutorials:
    print(i)

print("----------------------------------------------------")
index = displayer_pb2.TutorialIndex(value=response.length-1)
responses = stub.GetTutorial(index)
print(response.length)
for response in responses.slides:
    imgdata = b64decode(response.image)
    with open("tmp/"+"Slide0.png", 'wb') as f:
        f.write(imgdata)
    bindata = response.bin
    with open("tmp/"+"Slide0.bin", 'wb') as f:
        f.write(bindata)
    gltfdata = (response.gltf)
    with open("tmp/"+"Slide0.gltf", 'wb') as f:
        f.write(gltfdata)


