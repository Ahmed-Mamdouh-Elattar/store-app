import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    required this.label,
    this.prefixIcon,
    this.onSaved,
    this.showVisibiltyIcon = false,
  });
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String label;
  final IconData? prefixIcon;

  final bool showVisibiltyIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        label: Text(widget.label),
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.showVisibiltyIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
