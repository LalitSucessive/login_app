import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  String buttonName;
  VoidCallback function;
  Button({required this.buttonName, required this.function, super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                    onTap: widget.function,
                    child: Container(
                      height: 50.0,
                      margin: const EdgeInsets.all(10),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 250.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child:  Text(
                            widget.buttonName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  );
  }
}
