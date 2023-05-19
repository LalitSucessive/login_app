// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_app/home_page.dart';

import 'widgets/button/button.dart';
import 'widgets/text_field_otp_widget.dart';
import 'widgets/text_field_phone_widget.dart';

class OTPPage extends StatefulWidget {
  String phone;
  String id;
  OTPPage({required this.phone, required this.id, super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final _otpController = TextEditingController();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/otp.png',
                  scale: 1.8,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'OTP',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.lightBlue),
                ),
                const SizedBox(
                  height: 28,
                ),
                TextFieldOtpWidget(
                  controller: _otpController,
                ),
                const SizedBox(
                  height: 32,
                ),
                Button(
                    buttonName: "Verify OTP",
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        verifyOtp(_otpController.text.toString());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(String otp) async {
    try {
      Response response = await post(
          Uri.parse('https://test-otp-api.7474224.xyz/verifyotp.php'),
          body: jsonEncode(
              <String, String>{"request_id": widget.id, "code": otp}));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login Successfully')));

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(token: data['jwt'])));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('OTP is not valid')));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
