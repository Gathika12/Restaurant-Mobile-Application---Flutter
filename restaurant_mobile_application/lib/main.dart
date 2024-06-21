import 'package:flutter/material.dart';
import 'package:restaurant_mobile_application/home.dart';
import 'package:restaurant_mobile_application/welcome.dart';
import 'package:restaurant_mobile_application/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:restaurant_mobile_application/admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDZh-CnKMhV3Y8IYZGtEJwKBSptFXKY6_Q",
        authDomain: "restaurant-app-9ad6e.firebaseapp.com",
        projectId: "restaurant-app-9ad6e",
        storageBucket: "restaurant-app-9ad6e.appspot.com",
        messagingSenderId: "325817847315",
        appId: "1:325817847315:web:84ebce54cdbe7cffd679e6",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MaterialApp(
    home: Welcome(),
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
