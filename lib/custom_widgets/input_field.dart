import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController control;
  final String name;
  final String? error;
  final void Function(String)? onChange;

  CustomInputField(
      {required this.control, this.onChange, required this.name, this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 10,
        ),
        child: TextField(
          controller: control,
          onChanged: onChange,
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
            errorStyle: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: error,
          ),
        ),
      ),
    );
  }
}

class CustomPassWordField extends StatelessWidget {
  final String name;
  final String? error;
  final TextEditingController control;
  final void Function(String)? onChange;

  CustomPassWordField(
      {required this.name, this.onChange, this.error, required this.control});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
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
          controller: control,
          onChanged: onChange,
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
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.black.withOpacity(0.1),
            errorText: error,
          ),
        ),
      ),
    );
  }
}
