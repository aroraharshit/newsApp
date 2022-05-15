import 'package:flutter/material.dart';
import 'package:newsapp/helper/news.dart';
import '../models/article_model.dart';
import 'home.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category=""});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<dynamic> articles =<ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "App",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(top: 16),
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return BlogTile(
                    imageUrl: articles[index].urlToImage ?? "",
                    title: articles[index].title ?? "",
                    desc: articles[index].description ?? "",
                    url: articles[index].url ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
