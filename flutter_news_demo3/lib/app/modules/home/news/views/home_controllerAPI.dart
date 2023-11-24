import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:newsapp/app/modules/home/components/customListTile.dart';
import 'package:newsapp/app/modules/home/news/controllers/news_controller.dart';
import 'package:newsapp/app/modules/home/bindings/article_model.dart';
import 'package:newsapp/app/modules/home/news/views/news_screen.dart';

// class HomePage extends StatefulWidget {

//   @override
//   _HomePageState createState() => _HomePageState();
// }

class HomePage extends GetView<NewsController> {
  static const routeName = '/api';
  NewsController client = NewsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),

      // Now let's call the API services with the FutureBuilder widget
      body: FutureBuilder(
        future: client.getArticle(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Article>?> snapshot) {
          // Let's check if we got a response or not
          if (snapshot.hasData) {
            // Now let's make a list of articles
            List<Article> articles = snapshot.data ?? [];
            return ListView.builder(
              // Now let's create our custom List tile
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
