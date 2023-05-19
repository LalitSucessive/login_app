import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldnameWidget extends StatelessWidget {
  TextEditingController controller;
  bool isName;

  TextFieldnameWidget(
      {required this.controller, this.isName = false, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      controller: controller,
      keyboardType:
          isName == true ? TextInputType.name : TextInputType.emailAddress,
      validator: (value) => value!.isEmpty ? "This field is required" : null,
      decoration: decorationPhone(isName),
    );
  }
}

InputDecoration decorationPhone(bool name) {
  return InputDecoration(
    isDense: true,
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    labelText: name == true ? 'Enter Name' : 'Enter Email',
    labelStyle:
        const TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
  );
}
