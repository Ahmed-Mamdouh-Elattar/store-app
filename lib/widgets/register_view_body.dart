import 'package:flutter/material.dart';
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
                title: "Register",
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
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
}
