# Protos

This directory is used to store the protobuf files

### Packages:

* pip3 install grpcio
* pip3 install grpcio-tools
* pub global activate protoc_plugin     ([https://grpc.io/docs/quickstart/dart/](Source for help))


### Generate for python BackEnd server:

```python3 -m grpc_tools.protoc -I. --python_out=../BackEnd/ --grpc_python_out=../BackEnd/ displayer.proto```


### Generate for Flutter ar_app:

```protoc --dart_out=../ar_app/lib/ displayer.proto```
