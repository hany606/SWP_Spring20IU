import 'dart:math';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

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
