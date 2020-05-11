// Source: https://stackoverflow.com/questions/49809351/how-to-create-a-circle-icon-button-in-flutter
import 'screens/tutorial_selection.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('AR virtual Assistant SWP G6'),
      ),
      body: new Center(
          child: new InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TutorialSelection()));
          },
          child: new Container(
            width: 200.0,
            height: 200.0,
            padding: const EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: Center(
                  child: new Text("Select a Tutorial", style: new TextStyle(color: Colors.white, fontSize: 30.0), textAlign: TextAlign.center),
            )
          ),
        ),
      ),
    );
  }
}
