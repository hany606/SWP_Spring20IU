# GRPC-Test:

* Sourec: https://www.semantics3.com/blog/a-simplified-guide-to-grpc-in-python-6c4e25f0c506/

### Packages:

* pip3 install grpcio
* pip3 install grpcio-tools

### Impotant commands:

* python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. calculator.proto