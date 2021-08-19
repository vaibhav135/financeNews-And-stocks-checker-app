import 'package:flutter/material.dart';
import '../widgets/news_card.dart' as NewsCards;
import '../api_calls/call_news_api.dart' as NewsApi;

class GetNews extends StatefulWidget {
  GetNews({Key? key, required this.url}) : super(key: key);
  final String url;
  _GetNewsState createState() => _GetNewsState();
}

class _GetNewsState extends State<GetNews> {
  List<NewsApi.News> news = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsApi.News>>(
        future: NewsApi.fetchAlbum(widget.url),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has ocurred'),
            );
          } else if (snapshot.hasData) {
            news = snapshot.data!;
            return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsCards.NewsCards(
                    title: news[index].title,
                    author: news[index].author,
                    url: news[index].url,
                    urlToImage: news[index].urlToImage,
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
