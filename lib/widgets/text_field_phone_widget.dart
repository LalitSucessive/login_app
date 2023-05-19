import 'package:flutter/material.dart';

class TextFieldPhoneWidget extends StatelessWidget {
  TextEditingController controller;

  TextFieldPhoneWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 10,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) => value!.isEmpty ? "This field is required" : null,
      decoration: decorationPhone(),
    );
  }
}

InputDecoration decorationPhone() {
  return const InputDecoration(
    isDense: true,
    prefixIcon: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
        child: Text(
          "+91",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        )),
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
    labelText: 'Phone Number',
    labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
  );
}
