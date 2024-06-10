import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  WelcomePage createState() => WelcomePage();
}

class WelcomePage extends State<Welcome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/burger.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.5), // Semi-transparent overlay
          ),
          Column(
            children: <Widget>[
              AppBar(
                title: Text(
                  'Login In To Your Account',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                          //controller: _passwordController,
                          decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width:
                                  3.0), // Increased border width when focused
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      )),
                      SizedBox(height: 20),
                      TextFormField(
                          //controller: _passwordController,
                          decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width:
                                  3.0), // Increased border width when focused
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      )),
                      SizedBox(height: 20),
                      Center(
                          child: ElevatedButton(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                fixedSize: Size(150, 30),
                                elevation: 0,
                              ),
                              onPressed: () async {
                                /*FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {*/
                              }))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
