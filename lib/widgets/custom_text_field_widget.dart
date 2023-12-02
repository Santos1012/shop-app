import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController productTitleController;
  final String labelText;

  const CustomTextField(
      {super.key,
      required this.productTitleController,
      required this.labelText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: labelText=="Price"?TextInputType.number:TextInputType.text,
      controller: productTitleController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelText: labelText,
      ),
    );
  }
}
