import 'package:flutter/material.dart';
import 'package:store_app/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Store App"),
      ),
      body: const RegisterViewBody(),
    );
  }
}
