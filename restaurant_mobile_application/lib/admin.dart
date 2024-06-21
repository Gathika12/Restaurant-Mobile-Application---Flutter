import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AdminPage(),
  ));
}

class AdminPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController ItemCodeController = TextEditingController();
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
    );

    print(response.body);*/
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        await sendEmail(
          firstName: ItemCodeController.text,
          lastName: _lastNameController.text,
          username: _usernameController.text,
          password: _passwordController.text,
        );
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );*/
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
                            controller: ItemCodeController,
                            labelText: 'Item Code',
                            icon: Icons.numbers,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Item Code';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _lastNameController,
                            labelText: 'Item Name',
                            icon: Icons.title,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Item name';
                              }
                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _emailController,
                            labelText: 'SubTitle',
                            icon: Icons.subtitles,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your SubTitle';
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
                            labelText: 'Description',
                            icon: Icons.description,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Description';
                              }

                              return null;
                            },
                          ),
                          _buildOvalTextFieldWithIcon(
                            controller: _usernameController,
                            labelText: 'Price',
                            icon: Icons.price_check,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a Price';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 180.0,
                          ),
                          ElevatedButton(
                            onPressed: signUp,
                            child: Text(
                              'Launch Item',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black.withOpacity(0.8),
                              fixedSize: Size(100.0, 50.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
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
    ItemCodeController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _contactNoController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }
}
