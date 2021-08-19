import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCards extends StatefulWidget {
  final String title;
  final String author;
  final String url;
  final String urlToImage;

  NewsCards(
      {Key? key,
      required this.title,
      required this.author,
      required this.url,
      required this.urlToImage})
      : super(key: key);

  _NewsCardsState createState() => _NewsCardsState();
}

class _NewsCardsState extends State<NewsCards> {
  //List<NewsApi.News> singleNews = widget.perNews;
  Future<void>? _launched;
  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(widget.title),
              subtitle: Text(widget.author),
              trailing: Image.network(
                widget.urlToImage,
                scale: 5.0,
                height: 70,
                width: 90,
              ),
            ),
          ],
        ),
      ),
      onTap: () => setState(() {
        _launched = _launchInWebViewWithJavaScript(widget.url);
      }),
    );
  }
}
