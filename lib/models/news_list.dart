import 'package:flutter/material.dart';
import '../widgets/drawer.dart' as CustomDrawer;
import '../models/get_news.dart' as GetNews;

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  String currentUrl =
      'https://newsapi.org/v2/everything?q=finance OR fintech OR cryptocurrency OR stocks &language=en&apiKey=f5fda593a64f408a9764ac6aeea0eac5';
  String topHeadlinesUrl =
      'https://newsapi.org/v2/top-headlines?q=finance OR fintech OR cryptocurrency OR stocks &language=en&apiKey=f5fda593a64f408a9764ac6aeea0eac5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Current",
              ),
              Tab(text: "Top-Headlines"),
            ],
          ),
          title: Text("news")),
      drawer: CustomDrawer.MyDrawer(selectedDestination: "news"),
      body: TabBarView(children: [
        GetNews.GetNews(url: currentUrl),
        GetNews.GetNews(url: topHeadlinesUrl)
      ]),
    );
  }
}
