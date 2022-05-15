
import 'dart:convert';
import 'dart:math';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];
  Future<void> getNews() async{
    Uri url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=7b65df3fce08453690cbc46bf9213d71');
    var response =await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']== "ok") {
    jsonData["articles"].forEach((element){
    if(element["urlToImage"] != null && element['description'] != null){
      ArticleModel articleModel = ArticleModel(
        title: element['title'],
        author: element["author"],
        description: element["description"],
        url: element["url"],
        urlToImage: element["urlToImage"],
        content: element["context"],
      );
      news.add(articleModel);
    }
    });
    }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news =[];
  Future<void> getNews(String category) async{
    Uri url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7b65df3fce08453690cbc46bf9213d71');
    var response =await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']== "ok") {
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}