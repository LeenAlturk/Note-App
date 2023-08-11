import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final String Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    Key? key,
    required this.keyboardType,
    required this.labelText,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(),
        ),
        labelText: labelText,
      ),
    );
  }
}
