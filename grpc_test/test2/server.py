
import grpc
from concurrent import futures
import time

# import the generated classes
import displayer_pb2
import displayer_pb2_grpc

# import the original calculator.py
import BackEnd

# create a class to define the server functions, derived from
# displayer_pb2_grpc.HelperServicer
class HelperServicer(displayer_pb2_grpc.HelperServicer):

    def GetTutorialsList(self, request, context):
        response = displayer_pb2.TutorialsList()
        tutorials = BackEnd.get_tutorials()
        response.length = len(tutorials)
        for i in tutorials:
            tutorial = displayer_pb2.TutorialInfo()
            tutorial.name = i["name"]
            tutorial._id = i["_id"]
            tutorial.length = i["length"]
            response.tutorials.append(tutorial)
        return response

    def GetTutorial(self, request, context):
        tutorial = BackEnd.get_tutorial(request.value)
        response = displayer_pb2.Tutorial(length=tutorial["length"], name=tutorial["name"], _id=tutorial["_id"])
        for raw_slide in tutorial["slides"]:
            slide = displayer_pb2.Slide(image=raw_slide["image"], bin=raw_slide["bin"], gltf=raw_slide["gltf"])
            response.slides.append(slide)
        return response


# create a gRPC server
server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))

displayer_pb2_grpc.add_HelperServicer_to_server(
        HelperServicer(), server)

# listen on port 50051
print('Starting server. Listening on port 50051.')
server.add_insecure_port('[::]:50051')
server.start()

# since server.start() will not block,
# a sleep-loop is added to keep alive
try:
    while True:
        time.sleep(86400)
except KeyboardInterrupt:
    server.stop(0)