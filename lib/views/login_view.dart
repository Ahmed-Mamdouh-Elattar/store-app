import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    disposeOnboardingViews();
  }

  void disposeOnboardingViews() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
