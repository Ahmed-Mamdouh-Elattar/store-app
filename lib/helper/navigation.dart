import 'package:flutter/material.dart';

class Navigation {
  void push(BuildContext context, {required Widget view}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  void pushReplacement(BuildContext context, {required Widget view}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  void pushAndRemoveUntil(BuildContext context, {required Widget view}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => view,
      ),
      (Route<dynamic> route) => false,
    );
  }
}
