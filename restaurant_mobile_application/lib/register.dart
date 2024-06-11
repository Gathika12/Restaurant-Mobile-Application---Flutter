import 'dart:async';
import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:practice02/login.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactNoController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  Widget _buildOvalTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool isPassword = false,
    required String? Function(String?)? validator,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white.withOpacity(0.5),
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: Colors.blueAccent,
          ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        ),
        validator: validator,
      ),
    );
  }

  Future<void> sendEmail({
    required String firstName,
    required String lastName,
    required String username,
    required String password,
  }) async {
    final serviceId = 'service_na7bm48';
    final templateId = 'template_l0yxn67';
    final userId = 'your_user_id';

    /*final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'first_name': firstName,
          'last_name': lastName,
          'username': username,
          'password': password,
        }
      }),
    );*/

    // print(response.body);
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        await sendEmail(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          username: _usernameController.text,
          password: _passwordController.text,
        );
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),*/
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send email: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/burger.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    'Create Your Account',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildOvalTextFieldWithIcon(
                            controller: _firstNameController,
                            labelText: 'First Name',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _lastNameController,
                            labelText: 'Last Name',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _emailController,
                            labelText: 'Email',
                            icon: Icons.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _contactNoController,
                            labelText: 'Contact No',
                            icon: Icons.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your contact number';
                              }
                              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                return 'Please enter a valid contact number';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _usernameController,
                            labelText: 'Username',
                            icon: Icons.account_circle,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a username';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _passwordController,
                            labelText: 'Password',
                            icon: Icons.lock,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _retypePasswordController,
                            labelText: 'Retype Password',
                            icon: Icons.lock,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please retype your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              /*if (_formKey.currentState!.validate()) {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then((value) {
                                  print("Created your account");
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Home()));
                                }).onError((error, stackTrace) {
                                  print("Error ${error.toString()}");
                                });
                              }
                  
                              CollectionReference collRef =
                                  FirebaseFirestore.instance.collection("clients");
                              collRef.add(
                                {
                                  'First Name': _firstNameController.text,
                                  'Last Name': _lastNameController.text,
                                  'Email': _emailController.text,
                                  'Contact No': _contactNoController.text,
                                  'Username': _usernameController.text,
                                  'Password': _passwordController.text,
                                  'Retype Password': _retypePasswordController.text,
                                },
                              );*/
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _contactNoController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }
}
