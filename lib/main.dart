import 'package:flutter/material.dart';
import 'package:store_app/views/onboarding_views.dart';

void main() {
  runApp(const StoreAPP());
}

class StoreAPP extends StatelessWidget {
  const StoreAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingViews(),
    );
  }
}
