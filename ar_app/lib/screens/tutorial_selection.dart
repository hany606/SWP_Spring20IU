import 'package:flutter/material.dart';
import 'tutorial_running.dart';
// import 'tutorial_running2.dart';
// import 'test_grpc.dart';


class TutorialSelection extends StatefulWidget {
    @override
  _TutorialSelectionState createState() => _TutorialSelectionState();
}

class _TutorialSelectionState extends State<TutorialSelection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Select a Tutorial')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {

    // backing data
    final tutorials = ['Tutorial 1', 'Tutorial 2', 'Tutorial 3', 'Tutorial 4'];

    return ListView.builder(
      itemCount: tutorials.length,
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TutorialRunning(index)));
                  // MaterialPageRoute(builder: (context) => TutorialRunning2()));
                  // MaterialPageRoute(builder: (context) => TestGRPC()));
            },
          title: Text(tutorials[index]),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      },
    );

  }