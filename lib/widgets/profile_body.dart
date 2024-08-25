import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/cubits/cubit/user_data_cubit.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/widgets/custom_circle_avatar.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = BlocProvider.of<UserDataCubit>(context).userData!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomCircleAvatar(
              backgroundImage: NetworkImage(user.image),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 0.5,
              endIndent: 50,
              indent: 50,
            ),
            CustomListTile(
              leadingText: "Email",
              textValue: user.email,
            ),
            CustomListTile(
              leadingText: "Name",
              textValue: user.name,
            ),
            CustomListTile(
              leadingText: "Gender",
              textValue: user.gender,
            ),
            CustomListTile(
              leadingText: "Birth date",
              textValue: user.birthDate,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leadingText,
    required this.textValue,
  });
  final String leadingText;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "$leadingText : ",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      title: Text(textValue),
    );
  }
}
