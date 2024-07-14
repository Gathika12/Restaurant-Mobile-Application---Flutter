import 'package:flutter/material.dart';
import 'package:restaurant_mobile_application/home.dart';
import 'package:restaurant_mobile_application/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    home: Welcome(),
  ));
}

class Welcome extends StatefulWidget {
  @override
  WelcomePage createState() => WelcomePage();
}

class WelcomePage extends State<Welcome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            color: Colors.white.withOpacity(0.5),
          ),
          Column(
            children: <Widget>[
              AppBar(
                centerTitle: true,
                title: Text(
                  'Login In To Your Account',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.orange.withOpacity(0.5),
                elevation: 0.0,
              ),
              SizedBox(height: 300),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size(150, 30),
                            elevation: 0,
                          ),
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            } catch (e) {
                              // Handle login errors
                              print(
                                  'Login Error: $e'); // Print the error to console for debugging
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Login failed: $e')), // Show error in a SnackBar
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size(150, 30),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                      ),
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
