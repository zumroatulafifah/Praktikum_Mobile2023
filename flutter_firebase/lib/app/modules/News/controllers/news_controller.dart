import 'package:flutter_firebase/app/modules/News/bindings/news_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart';

class NewsController extends GetxController {
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=834ad62dc383498ea7d2e41f5c111cd9';

  Future<List<Article>> getArticle() async {
    final response = await get(Uri.parse(_baseUrl));
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
