import 'dart:convert';
import 'package:http/http.dart';
import '../model/article_model.dart';

//HTTP request services
//simple get HTTP request from the API ang get articles and then return the list of Articles

class ApiService {
  //Endpoint url

  //NOTE: Make sure to add your API key here
  var endPointUrl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=588035a3856b47478330c087bf5b629d');

  //Get request
  Future<List<Article>> getArticle() async {
    print("Getting articles from the API");
    Response res = await get(endPointUrl);
    print(res.body);
    print("Got articles from the API");

    if (res.statusCode == 200) {
      print("Got articles from the API successfully");
      //If the call to the server was successful, parse the JSON
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //Get the articles from the json
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      print("Parsed articles:");
      print(articles);
      return articles;
    } else {
      //If that call was not successful, throw an error.
      throw Exception('Failed to load articles from the API');
    }
  }
}
