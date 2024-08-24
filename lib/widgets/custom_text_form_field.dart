import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.label,
    this.prefixIcon,
    this.onSaved,
    this.showVisibiltyIcon = false,
    this.controller,
    this.hint,
    this.readOnly = false,
    this.onPressedTextFormField,
  });
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String? label;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool showVisibiltyIcon;
  final String? hint;
  final bool readOnly;
  final void Function()? onPressedTextFormField;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      validator: widget.validator,
      onSaved: widget.onSaved,
      readOnly: widget.readOnly,
      onTap: widget.onPressedTextFormField,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
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
