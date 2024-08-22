import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/views/onboarding_views.dart';

bool isOnboardingAppear = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  isOnboardingAppear = prefs.containsKey('onboarding');
  runApp(const StoreAPP());
}

class StoreAPP extends StatelessWidget {
  const StoreAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isOnboardingAppear ? const LoginView() : const OnboardingViews(),
    );
  }
}
