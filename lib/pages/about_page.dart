import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            'Hello! This application I have created with flutter. It uses the newsapi.org API to get the latest news. I am building this application to learn flutter. I am planning also to include an option to search for news by keyword. I am also planning to add a feature to save news articles to a database and check the weather with OpenWeather API.'),
      ),
    );
  }
}
