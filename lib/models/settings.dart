import 'package:flutter/material.dart';
import '../widgets/drawer.dart' as CustomDrawer;

class Settings extends StatefulWidget {
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("settings")),
      drawer: CustomDrawer.MyDrawer(selectedDestination: "settings"),
      body: Column(
        children: [
          Center(child: Text("Hello this is settings")),
        ],
      ),
    );
  }
}
