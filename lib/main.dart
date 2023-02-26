// ignore_for_file: prefer_const_constructors
import 'package:alfa_romeo/components/customListTile.dart';
import 'package:alfa_romeo/services/api_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/article_model.dart';
import 'package:alfa_romeo/Navbar/navbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  List<Article> articles = [];
  @override
  void initState() {
    super.initState();
    client.getArticle().then((value) {
      setState(() {
        articles = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(
        IconThemeData(color: Colors.white),
      ),
      appBar: AppBar(
        title: const Text('News App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),

      //Future builder to get the articles
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading spinner while waiting for data
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Display an error message if an error occurs
            return Center(
              child: Text('Failed to load articles from the API'),
            );
          } else if (snapshot.hasData) {
            // Display the articles if data is available
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          } else {
            // Display a fallback message if no data is available
            return Center(
              child: Text('No articles available'),
            );
          }
        },
      ),
    );
  }
}
