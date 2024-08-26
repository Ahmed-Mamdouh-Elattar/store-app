import 'package:flutter/material.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.categoryName,
    this.onTap,
    this.showColor = false,
  });

  final String categoryName;
  final void Function()? onTap;
  final bool showColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: showColor ? Colors.deepPurpleAccent.withOpacity(0.4) : null,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.black)),
        alignment: Alignment.center,
        width: 130,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(categoryName),
        ),
      ),
    );
  }
}
