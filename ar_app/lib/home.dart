import 'package:arcore_flutter_plugin_example/screens/tutorial_running.dart';
import 'package:arcore_flutter_plugin_example/screens/tutorial_selection.dart';
import 'package:flutter/material.dart';
import 'screens/tutorial_running.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArCore SWP G6'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TutorialRunning()));
            },
            title: Text("Preview"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TutorialSelection()));
            },
            title: Text("Select tutorial"),
          ),
        ],
      ),
    );
  }
}
