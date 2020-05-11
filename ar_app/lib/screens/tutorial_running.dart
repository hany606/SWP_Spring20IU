import 'dart:math';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:mongo_dart/mongo_dart.dart';
import 'dart:typed_data';



class TutorialRunning extends StatefulWidget {
  int tutorial_idx = 0;
  TutorialRunning(this.tutorial_idx);
  @override
  _TutorialRunningState createState() => _TutorialRunningState(tutorial_idx);
}

class _TutorialRunningState extends State<TutorialRunning> {

  int tutorial_idx = 0;

  _TutorialRunningState(int tidx){
    tutorial_idx = tidx;
  }

  ArCoreController arCoreController;
  ArCoreNode slideNode;
  int slideIdx = -1;
  


  List<List<double>> positions_raw = [[0, 0, -2],[1, 0, -2], [2, 0, -2],[3, 0, -2], [4, 0, -2]];
  List<vector.Vector3> positions = new List();

  List<List<double>> rotations_raw = [[0, 1, 0, 1],[0, 1, 0, 1.25], [0, 1, 0, 1.5],[0, 1, 0, 1.75], [0, 1, 0, 2]];
  List<vector.Vector4> rotations = new List();

  // List<String> slides = ["https://github.com/hany606/SWP_Spring20IU/raw/sprint2-AR-app/gltf_exporter/tutorial2/Slide0.gltf",
  //                        "https://github.com/hany606/SWP_Spring20IU/raw/sprint2-AR-app/gltf_exporter/tutorial1/Slide1.gltf",
  //                        "https://github.com/hany606/SWP_Spring20IU/raw/sprint2-AR-app/gltf_exporter/tutorial1/Slide2.gltf",
  //                        "https://github.com/hany606/SWP_Spring20IU/raw/sprint2-AR-app/gltf_exporter/tutorial1/Slide3.gltf",
  //                        "https://github.com/hany606/SWP_Spring20IU/raw/sprint2-AR-app/gltf_exporter/tutorial1/Slide4.gltf",
  //                        "https://github.com/hany606/SWP_Spring20IU/raw/sprint2-AR-app/gltf_exporter/tutorial1/Slide5.gltf"];

  List<ByteData> slides = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Running a tutorial'),
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
              maxSlideIdx: slides.length,
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
      positions.add(vector.Vector3(positions_raw[i][0],positions_raw[i][1],positions_raw[i][2]));
      rotations.add(vector.Vector4(rotations_raw[i][0],rotations_raw[i][1],rotations_raw[i][2], rotations_raw[i][3]));
    }

    _getSlides(tutorial_idx);

    _addIntroGuide();
    // _addSlide(0);
  }

  void _getSlides(int tutorial_idx) async{
    Db db = Db("mongodb://127.0.0.1:27017/");
    await db.open();
    DbCollection coll = db.collection("presentations");
    var result = await coll.find(where.eq("id", tutorial_idx)).forEach((v)=>{
      slides.add(v["img"])
    });
    await db.close();
  }

  void _addIntroGuide() {
    final introSlide = ArCoreReferenceNode(
        name: "current",
        objectUrl:
            "https://github.com/hany606/SWP_Spring20IU/raw/sprint2-AR-app/gltf_exporter/tutorial1/Slide0.gltf",
        position: positions[0],
        rotation: rotations[0]
        );
        arCoreController.addArCoreNodeWithAnchor(introSlide);

  }

  void _addSlide(int idx) {
    final current_material = ArCoreMaterial(
      textureBytes: slides[idx].buffer.asUint8List()
    );

    final current_cube_shape = ArCoreCube(
      materials: [current_material],
    );

    // final slideNode = ArCoreReferenceNode(
      final slideNode = ArCoreNode(
        name: "current",
        // objectUrl: slides[idx],
        shape: current_cube_shape,
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
  final int initialSlideIdx;
  final int minSlideIdx = 0;
  final int maxSlideIdx;
  
  final ValueChanged<int> onSlideChange;

  const SlideControl(
      {Key key,
      this.initialSlideIdx,
      this.maxSlideIdx,
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
