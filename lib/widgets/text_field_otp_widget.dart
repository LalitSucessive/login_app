import 'package:flutter/material.dart';

class TextFieldOtpWidget extends StatelessWidget {
  TextEditingController controller;

  TextFieldOtpWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      validator: (value) => value!.isEmpty ? "This field is required" : null,
      decoration: decorationPhone(),
    );
  }
}

InputDecoration decorationPhone() {
  return const InputDecoration(
    isDense: true,
    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    hintText: 'Enter OTP',
    hintStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
  );
}
