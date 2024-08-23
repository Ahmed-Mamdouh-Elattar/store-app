import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.purple,
      padding: const EdgeInsets.all(0),
      onPressed: onPressed ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
