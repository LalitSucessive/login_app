// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_app/main.dart';
import 'package:test_app/otp_page.dart';
import 'package:test_app/widgets/button/button.dart';
import 'package:test_app/widgets/text_field_phone_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Form(
          key: _formKey,
          child: _padding(),
        ),
      ),
    );
  }

  Padding _padding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.png',
              scale: 1.5,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'Login',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.lightBlue),
            ),
            const SizedBox(
              height: 28,
            ),
            TextFieldPhoneWidget(controller: _phoneController),
            const SizedBox(
              height: 32,
            ),
            Button(
                buttonName: "Send OTP",
                function: () {
                  if (_formKey.currentState!.validate()) {
                    login(
                      _phoneController.text.toString(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  void login(String phone) async {
    try {
      Response response =
          await post(Uri.parse('https://test-otp-api.7474224.xyz/sendotp.php'),
              body: jsonEncode(<String, String>{
                'mobile': phone,
              }));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['response']);
        print(data['request_id']);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OTPPage(phone: phone, id: data['request_id'])));
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
