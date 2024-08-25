import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leadingText,
    required this.textValue,
  });
  final String leadingText;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "$leadingText : ",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      title: Text(textValue),
    );
  }
}
