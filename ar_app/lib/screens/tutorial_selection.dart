import 'dart:math';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class TutorialSelection extends StatefulWidget {
  @override
  _TutorialSelectionState createState() => _TutorialSelectionState();
}

class _TutorialSelectionState extends State<TutorialSelection> {
  ArCoreController arCoreController;
  ArCoreNode slideNode;
  int slideIdx = 0;


  // TODO: Import this from the setting of the tutorial
  List<List<double>> positions_raw = [[0, 0, -2],[1, 0, -2], [3, 0, -2],[4, -3, -2], [6, 0, -2]];
  List<vector.Vector3> positions = new List();

  List<List<double>> rotations_raw = [[0, 0, 0],[0, 0, 0], [0, 0, 0],[0, 0, 0], [0, 0, 0]];
  List<vector.Vector4> rotations = new List();

  List<String> slides = ["https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
                         "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Triangle/glTF/Triangle.gltf",
                         "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/AnimatedCube/glTF/AnimatedCube.gltf",
                         "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/BrainStem/glTF/BrainStem.gltf",
                         "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Fox/glTf/Fox.gltf"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Running a tutorial'),
          actions: <Widget>[
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ArCoreView(
                onArCoreViewCreated: _onArCoreViewCreated,
                enableTapRecognizer: true,
                enableUpdateListener: true,
              ),
              
            ),
            SlideControl(
              initialSlideIdx: slideIdx,
              onSlideChange: onSlideChange,
            ),
          ],
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    // arCoreController.onPlaneTap = _handleOnPlanTab;
    // arCoreController.onPlaneDetected = _handleOnPlaneDetected;


    for(int i = 0; i < positions_raw.length; i++){
      // debugPrint(positions_raw[i][0].toString());
      positions.add(vector.Vector3(positions_raw[i][0],positions_raw[i][1],positions_raw[i][2]));
      rotations.add(vector.Vector4(rotations_raw[i][0],rotations_raw[i][1],rotations_raw[i][2],0));
    }

    // _addSphereGuide(arCoreController);
    _addSlide(0);
  }



  // void _handleOnPlanTab(List<ArCoreHitTestResult> hits) {
  //   debugPrint("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

  //   final hit = hits.first;
  //   debugPrint("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

  //   if(nextFlag){
  //       debugPrint("--------------------------------------------");
  //     nextFlag = false;
  //     _updateSlide(hit);
  //   }
    
  // }

  // void _handleOnPlaneDetected(ArCorePlane plane) {  
  //   debugPrint("--------------------------------------------");

  //   // if(nextFlag){
  //   //     debugPrint("--------------------------------------------");
  //   //   nextFlag = false;
  //   //   _updateSlide(plane);
  //   // }
  // }

  void _addSphereGuide(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.yellow,
    );
    final slide = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    slideNode = ArCoreNode(
      shape: slide,
      position: vector.Vector3(0, 0, -1),
      name: "current"

    );

    // final toucanNode = ArCoreReferenceNode(
    //     name: "Toucano",
    //     objectUrl:
    //         "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
    //     position: vector.Vector3(0, 0, -2),

    //     );
        controller.addArCoreNode(slideNode);
        // arCoreController.addArCoreNodeWithAnchor(toucanNode);

  }

  // void _addSlide(ArCoreHitTestResult plane) {
  //   final material = ArCoreMaterial(
  //     color: Colors.yellow,
  //   );
  //   final slide = ArCoreSphere(
  //     materials: [material],
  //     radius: 0.1,
  //   );
  //   slideNode = ArCoreNode(
  //     shape: slide,
  //     name: "current",
  //     position: plane.pose.translation,
  //     rotation: plane.pose.rotation);
  //   arCoreController.addArCoreNode(slideNode);
  //   // arCoreController.addArCoreNode(slideNode);
  // }

  // void _updateSlide(ArCoreHitTestResult plane) {
  //   arCoreController.removeNode(nodeName: "current");
  //   _addSlide(plane);
  // }

  // onSlideChange(int newSlideIdx) {
  //   if (newSlideIdx != this.slideIdx) {
  //     this.slideIdx = newSlideIdx;
  //     nextFlag = true;
  //     updateMaterials();
  //     // _updateSlide();
  //   }
  // }

  void _addSlide(int idx) {
    // final material = ArCoreMaterial(
    //   color: Colors.yellow,
    // );
    // final slide = ArCoreSphere(
    //   materials: [material],
    //   radius: 0.1,
    // );
    // slideNode = ArCoreNode(
    //   shape: slide,
    //   name: "current",
    //   position: positions[idx],
    //   rotation: rotations[idx]
    // );
    

    final slideNode = ArCoreReferenceNode(
        name: "current",
        objectUrl: slides[idx],
        position: positions[idx],
        rotation: rotations[idx]
        );
    arCoreController.addArCoreNodeWithAnchor(slideNode);
  }

  void _updateSlide(int idx) {
    arCoreController.removeNode(nodeName: "current");
    _addSlide(idx);
  }

  onSlideChange(int newSlideIdx) {
    if (newSlideIdx != this.slideIdx) {
      this.slideIdx = newSlideIdx;
      _updateSlide(newSlideIdx);
    }
  }
  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}

class SlideControl extends StatefulWidget {
  // TODO: Configurations that will be set from the file of the tutorial describtion
  final int initialSlideIdx;
  final int minSlideIdx = 0;
  final int maxSlideIdx = 5;
  
  final ValueChanged<int> onSlideChange;

  const SlideControl(
      {Key key,
      this.initialSlideIdx,
      this.onSlideChange})
      : super(key: key);

  @override
  _SlideControlState createState() => _SlideControlState();
}

class _SlideControlState extends State<SlideControl> {
  int slideIdx;

  @override
  void initState() {
    slideIdx = widget.initialSlideIdx;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:   
        new Stack(
          //alignment:new Alignment(x, y)
          children: <Widget>[
            new Positioned(
              child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child: RaisedButton(
                    child: Text("Next"),
                    onPressed: () {
                      final newSlideIdx = min(slideIdx+1, widget.maxSlideIdx);
                      widget.onSlideChange(newSlideIdx);
                      setState(() {
                        slideIdx = newSlideIdx;
                      });
                    },
                  ),
              ),
            ),
            new Positioned(
              child: new Align(
                alignment: FractionalOffset.bottomRight,
                child: RaisedButton(
                    child: Text("Previous"),
                    onPressed: () {
                      final newSlideIdx = max(slideIdx-1,widget.minSlideIdx);
                      widget.onSlideChange(newSlideIdx);
                      setState(() {
                        slideIdx = newSlideIdx;
                      });
                    },
                  ),
              ),
            ),
          ],
        ),
    );
  }
}
