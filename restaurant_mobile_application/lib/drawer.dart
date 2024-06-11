import 'package:flutter/material.dart';
import 'package:restaurant_mobile_application/contactus.dart';
import 'package:restaurant_mobile_application/welcome.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.8),
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Cart'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          SizedBox(height: 350),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(1),
                  fixedSize: Size(300.0, 50.0)),
              child: Text(
                "Log out",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Drawer Example')),
      body: Center(child: Text('My Page!')),
      drawer: MyDrawer(),
    ),
  ));
}
