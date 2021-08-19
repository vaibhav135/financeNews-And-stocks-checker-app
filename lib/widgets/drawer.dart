import "package:flutter/material.dart";
import '../models/news_list.dart' as NewsList;
import '../models/stocks.dart' as Stocks;
import '../models/settings.dart' as Settings;

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key, required this.selectedDestination}) : super(key: key);
  final String selectedDestination;

  @override
  Widget build(BuildContext context) {
    print(selectedDestination);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 80.0, 0.0, 10.0),
            child: Text(
              'Header',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Image(
                image: AssetImage('lib/assets/icons/newspaper.png'),
                width: 30,
                height: 40,
                color: null,
              ),
              horizontalTitleGap: 35,
              title: Text(
                'news',
                style: TextStyle(fontSize: 18),
              ),
              selected: selectedDestination == "news",
              onTap: () {
                //Navigator.pushNamed(context, '/');
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsList.NewsList()),
                );
              }),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Image(
                image: AssetImage('lib/assets/icons/stock.png'),
                width: 30,
                height: 40,
                color: null,
              ),
              horizontalTitleGap: 35,
              title: Text(
                'stocks',
                style: const TextStyle(fontSize: 18),
              ),
              selected: selectedDestination == "stocks",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stocks.Stocks()),
                );
              }),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(Icons.settings),
              horizontalTitleGap: 35,
              title: Text(
                'Settings',
                style: const TextStyle(fontSize: 18),
              ),
              selected: selectedDestination == "settings",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings.Settings()),
                );
              }),
          SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Icon(Icons.info),
              horizontalTitleGap: 35,
              title: Text(
                'about',
                style: const TextStyle(fontSize: 18),
              ),
              selected: selectedDestination == "about",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsList.NewsList()),
                );
              }),
        ],
      ),
    );
  }
}
