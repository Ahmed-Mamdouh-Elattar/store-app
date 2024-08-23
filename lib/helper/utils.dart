import 'package:flutter/material.dart';

class Utils {
  showCustomDialog(BuildContext context,
      {required String text,
      bool showCancelButton = false,
      bool showContinueButton = false,
      void Function()? onPressedCancelButton,
      void Function()? onPressedContinueButton}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            showCancelButton
                ? TextButton(
                    onPressed: onPressedCancelButton,
                    child: const Text("Cancel"),
                  )
                : const SizedBox(),
            showContinueButton
                ? TextButton(
                    onPressed: onPressedContinueButton,
                    child: const Text("Continue"),
                  )
                : const SizedBox(),
          ],
          title: Text(
            text,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
