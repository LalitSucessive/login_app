// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_app/login_page.dart';

import 'widgets/button/button.dart';
import 'widgets/text_field_name_widget.dart';

class HomePage extends StatefulWidget {
  String token;
  HomePage({required this.token, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    scale: 1.8,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFieldnameWidget(
                    controller: _nameController,
                    isName: true,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFieldnameWidget(
                    controller: _emailController,
                    isName: false,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Button(
                      buttonName: "Submit Profile",
                      function: () {
                        if (_formKey.currentState!.validate()) {
                          submitProfile(_nameController.text.toString(),
                              _emailController.text.toString());
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submitProfile(String name, String email) async {
    try {
      Response response = await post(
          Uri.parse('https://test-otp-api.7474224.xyz/profilesubmit.php'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.token}',
          },
          body: jsonEncode(<String, String>{"name": name, "email": email}));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile Submit Successfully')));

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Somthing went wrong')));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
