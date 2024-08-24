// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/helper/navigation.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/views/take_personal_data_view.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
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
                'Register',
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
                  return Utils()
                      .validateTextFormField(value, "Password is required");
                },
                label: 'Password',
                prefixIcon: Icons.password,
                showVisibiltyIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "Register",
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    await userRegister(context);
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> userRegister(BuildContext context) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("provider id is ${user.user?.uid}");
      await savedUserId(user);
      Utils().showCustomDialog(
        context,
        text: "Done✅",
        showContinueButton: true,
        onPressedContinueButton: () {
          Navigation().push(context, view: const TakePersonalDataView());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils().showCustomDialog(
          context,
          text: "Weak password🧐",
          showCancelButton: true,
          onPressedCancelButton: () {
            Navigator.pop(context);
          },
        );
      } else if (e.code == 'email-already-in-use') {
        Utils().showCustomDialog(
          context,
          text: "Email already exists",
          showCancelButton: true,
          onPressedCancelButton: () {
            Navigator.pop(context);
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> savedUserId(UserCredential user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UID', user.user!.uid);
  }
}
