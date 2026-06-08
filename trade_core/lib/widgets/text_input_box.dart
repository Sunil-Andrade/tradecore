import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  const TextInputBox({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Enter your name',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
