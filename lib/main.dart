import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/cubits/products_category/products_category_cubit.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';

import 'package:store_app/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:store_app/firebase_options.dart';
import 'package:store_app/views/home_view.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/views/onboarding_views.dart';

bool isOnboardingAppear = false;
bool isUserLoginBefore = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  isOnboardingAppear = prefs.containsKey('onboarding');
  isUserLoginBefore = prefs.containsKey(kUserId);
  runApp(const StoreAPP());
}

class StoreAPP extends StatelessWidget {
  const StoreAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDataCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCategoryCubit(),
        ),
      ],
      child: MaterialApp(
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
        home: isOnboardingAppear
            ? isUserLoginBefore
                ? const HomeView()
                : const LoginView()
            : const OnboardingViews(),
      ),
    );
  }
}
