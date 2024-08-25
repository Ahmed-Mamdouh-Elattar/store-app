// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constanst.dart';

import 'package:store_app/helper/navigation.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/views/home_view.dart';
import 'package:store_app/views/register_view.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.scaleDown,
                width: MediaQuery.sizeOf(context).width * 0.6,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value == '') {
                    return "Email is required";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  } else {
                    return null;
                  }
                },
                label: 'Email',
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value == '') {
                    return "Password is required";
                  } else {
                    return null;
                  }
                },
                label: 'Password',
                prefixIcon: Icons.password,
                showVisibiltyIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "Login",
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    await loginUserUsingFirebase(context);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account"),
                  TextButton(
                    onPressed: () {
                      Navigation().push(context, view: const RegisterView());
                    },
                    child: const Text("register"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUserUsingFirebase(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(kUserId, credential.user!.uid);

      Navigation().pushAndRemoveUntil(context, view: const HomeView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils().showCustomDialog(
          context,
          text: "Email not found",
          showCancelButton: true,
          onPressedCancelButton: () => Navigator.pop(context),
        );
      } else if (e.code == 'wrong-password') {
        Utils().showCustomDialog(
          context,
          text: "Wrong password",
          showCancelButton: true,
          onPressedCancelButton: () => Navigator.pop(context),
        );
      }
    }
  }
}
