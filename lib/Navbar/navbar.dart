import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alfa_romeo/pages/about_page.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:alfa_romeo/main.dart';

class NavBar extends StatelessWidget {
  NavBar(IconThemeData iconThemeData);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Alex'),
            accountEmail: Text('alex.ihonen@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  'https://media.licdn.com/dms/image/C4D03AQFu5kqHeAReig/profile-displayphoto-shrink_200_200/0/1643617797634?e=1681344000&v=beta&t=X6QjpC4dscOj3RohwoW7IYheMbuHZZ_r3ODuBGSD5Ck',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Weather'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
