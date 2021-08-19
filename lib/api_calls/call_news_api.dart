import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<News> parseData(String responseBody) {
  var parsed =
      jsonDecode(responseBody)['articles'].cast<Map<String, dynamic>>();
  return parsed.map<News>((json) => News.fromJson(json)).toList();
}

Future<List<News>> fetchAlbum(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //print(jsonDecode(response.body)['articles']);
    return parseData(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class News {
  //final String name;
  final String title;
  final String author;
  //final String description;
  final String url;
  final String urlToImage;

  News(
      {required this.title,
      required this.url,
      required this.urlToImage,
      required this.author});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        author: json['author'],
        url: json['url'],
        urlToImage: json['urlToImage']);
  }
}
