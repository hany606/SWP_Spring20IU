# Protos

### Generate for python BackEnd server:
```cd SWP_Spring20IU/ar_app/```
```python3 -m grpc_tools.protoc -I. --python_out=../BackEnd/ --grpc_python_out=../BackEnd/ protoss/displayer.proto```

### Generate for flutter:
```cd SWP_Spring20IU/ar_app/```
```protoc --dart_out=grpc:lib/generated -Iprotos protos/displayer.proto ```