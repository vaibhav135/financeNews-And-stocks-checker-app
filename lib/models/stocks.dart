import 'package:flutter/material.dart';
import '../widgets/drawer.dart' as CustomDrawer;

class Stocks extends StatefulWidget {
  Stocks({Key? key}) : super(key: key);
  _StocksState createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: CustomDrawer.MyDrawer(selectedDestination: "stocks"),
      body: Column(
        children: [
          Center(child: Text("hello this is stocks")),
        ],
      ),
    );
  }
}
