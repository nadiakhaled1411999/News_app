import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled5/models/artticle_modle.dart';

class News{
  List<ArticleModle> news = [];

  Future<void> getNews() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=adcf4cfc2593408583df74693d3f655f';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element){
        if (element["description"] != null && element["urlToImage"] != null) {
          ArticleModle articleModel = ArticleModle(
            title: element['title'],
            description: element["description"],
            url: element['url'],
            urltoimage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });

    }
  }
}

class CategoryNewsClass{
  List<ArticleModle> news = [];

  Future<void> getNews(String category) async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=adcf4cfc2593408583df74693d3f655f';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element){
        if (element["description"] != null && element["urlToImage"] != null) {
          ArticleModle articleModel = ArticleModle(
            title: element['title'],
            description: element["description"],
            url: element['url'],
            urltoimage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });

    }
  }
}
