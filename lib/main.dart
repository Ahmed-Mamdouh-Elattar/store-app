import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/firebase_options.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/views/onboarding_views.dart';

bool isOnboardingAppear = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  isOnboardingAppear = prefs.containsKey('onboarding');
  runApp(const StoreAPP());
}

class StoreAPP extends StatelessWidget {
  const StoreAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          shadowColor: Colors.black,
          elevation: 8,
          surfaceTintColor: Colors.white,
        ),
      ),
      home: isOnboardingAppear ? const LoginView() : const OnboardingViews(),
    );
  }
}
