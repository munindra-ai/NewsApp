import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapp/model/model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=2b563e9eb20446589872fa390cd0563f";

  Future<List<Article>> getArticle() async {
    Response response = await get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
