import 'package:newsapp/app/modules/home/bindings/article_model.dart';
import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=834ad62dc383498ea7d2e41f5c111cd9");

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
