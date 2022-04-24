import 'package:newsapp/model/source.dart';

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;

  //constructor
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
  });

  //Function that will map the json into a list
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'],
    );
  }
}
