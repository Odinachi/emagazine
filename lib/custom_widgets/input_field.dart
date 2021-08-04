import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomInputField extends StatelessWidget {
  final void Function(String) onChangeCallback;
  final String name;

  CustomInputField({required this.onChangeCallback, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 10,
        ),
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: name,
            hintStyle: TextStyle(fontSize: 20),
            filled: true,
            fillColor: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}

class CustomPassWordField extends StatelessWidget {
  final String name;
  final String? error;
  final void Function(String) onChangeCallback;

  CustomPassWordField(
      {required this.name, this.error, required this.onChangeCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 10,
        ),
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
          obscureText: true,
          onChanged: onChangeCallback,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: name,
              hintStyle: TextStyle(fontSize: 20),
              filled: true,
              errorStyle: TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
              fillColor: Colors.black.withOpacity(0.1),
              errorText: error),
        ),
      ),
    );
  }
}
