// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/app/modules/Dashboard/bindings/article_model2.dart';
// import 'package:flutter_firebase/app/modules/Dashboard/views/article_screen.dart';
// import 'package:flutter_firebase/app/modules/Dashboard/views/bottom_nav_bar.dart';
// import 'package:flutter_firebase/app/modules/Dashboard/views/custom_tag.dart';
// import 'package:flutter_firebase/app/modules/News/views/image_container.dart';
// // import 'package:newsapp/app/modules/home/controllers/image_container.dart';

// // import '../controllers/bottom_nav_bar.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   static const routeName = '/';
//   @override
//   Widget build(BuildContext context) {
//     Article article = Article.articless[0];

//     return Scaffold(
//       appBar: AppBar(
//         // ikon menu list widget kiri atas
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.menu,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(index: 0),
//       extendBodyBehindAppBar: true,
//       body: ListView(padding: EdgeInsets.zero, children: [
//         _NewsOfTheDay(article: article),
//         _BreakingNews(articles: Article.articless),
//       ]),
//     );
//   }
// }

// class _BreakingNews extends StatelessWidget {
//   const _BreakingNews({
//     Key? key,
//     required this.articles,
//   }) : super(key: key);

//   final List<Article> articles;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 'News App',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall!
//                     .copyWith(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 250,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: articles.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(right: 10),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.pushNamed(
//                         context,
//                         ArticleScreen.routeName,
//                         arguments: articles[index],
//                       );
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ImageContainer(
//                           width: MediaQuery.of(context).size.width * 0.5,
//                           imageUrl: articles[index].imageUrl,
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           articles[index].title,
//                           maxLines: 2,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .copyWith(
//                                   fontWeight: FontWeight.bold, height: 1.5),
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                             '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
//                             style: Theme.of(context).textTheme.bodySmall),
//                         const SizedBox(height: 5),
//                         Text('by ${articles[index].author}',
//                             style: Theme.of(context).textTheme.bodySmall),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _NewsOfTheDay extends StatelessWidget {
//   const _NewsOfTheDay({
//     Key? key,
//     required this.article,
//   }) : super(key: key);

//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return ImageContainer(
//       height: MediaQuery.of(context).size.height * 0.45,
//       width: double.infinity,
//       padding: const EdgeInsets.all(20.0),
//       imageUrl: article.imageUrl,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomTag(
//             backgroundColor: Colors.grey.withAlpha(150),
//             children: [
//               Text(
//                 'Berita Hari Ini',
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       color: Colors.white,
//                     ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Text(
//             article.title,
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                 fontWeight: FontWeight.bold, height: 1.25, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
