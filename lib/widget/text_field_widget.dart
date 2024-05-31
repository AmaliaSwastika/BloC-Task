import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final String errorMsg;
  final Function(String) onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const TextFieldWidget({
    required this.label,
    required this.hint,
    required this.errorMsg,
    required this.onChanged,
    required this.controller,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          border: const UnderlineInputBorder(),
          label: Text(label),
          hintText: hint,
          icon: errorMsg.isEmpty
              ? null
              : Text(
                  errorMsg,
                  style: const TextStyle(fontSize: 12, color: Colors.red),
                ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
      onChanged: onChanged,
      controller: controller,
    );
  }
}