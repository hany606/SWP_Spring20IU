import 'dart:math';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../generated/displayer.pb.dart';
import '../generated/displayer.pbenum.dart';
import '../generated/displayer.pbgrpc.dart';
import '../generated/displayer.pbjson.dart';



class TestGRPC extends StatefulWidget {
  @override
  _TestGRPCState createState() => _TestGRPCState();
}

class _TestGRPCState extends State<TestGRPC> {
  // TODO: request the tutorial with specific id 
  // TODO: get the number of the slides
  // TODO: Start request slide by slide with next and prev

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Running a tutorial'),
        ),
        body: new Text("asdasd")
      ),
    );
  }
}

// class GrpcClientSingleton {
//   ClientChannel client;
//   static final GrpcClientSingleton _singleton =   new GrpcClientSingleton._internal();

//   factory GrpcClientSingleton() => _singleton;

//   GrpcClientSingleton._internal() {
//     client = ClientChannel("192.168.43.1", // Your IP here, localhost might not work.
//         port: 3000,
//         options: ChannelOptions(
//           //TODO: Change to secure with server certificates
//           credentials: ChannelCredentials.insecure(),
//           idleTimeout: Duration(minutes: 1),
//         ));
//   }
// }
