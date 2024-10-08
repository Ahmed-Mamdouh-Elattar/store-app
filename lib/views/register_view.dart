import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(kAppBarTitle),
      ),
      body: const RegisterViewBody(),
    );
  }
}
