import 'package:flutter/material.dart';
import 'package:restaurant_mobile_application/home.dart';
import 'package:restaurant_mobile_application/welcome.dart';
import 'package:restaurant_mobile_application/register.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:restaurant_mobile_application/admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDK4FxslOXgh0KnlqSdbbyVWyIdddKljts",
            authDomain: "blood-donation-92d7a.firebaseapp.com",
            projectId: "blood-donation-92d7a",
            storageBucket: "blood-donation-92d7a.appspot.com",
            messagingSenderId: "1012394506879",
            appId: "1:1012394506879:android:79e7947219187b2ba45d4a"));
  } else {
    await Firebase.initializeApp();
  }*/

  runApp(MaterialApp(
    home: AdminPage(),
  ));
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My App"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
