import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/widgets/custom_circle_avatar.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomCircleAvatar(
              backgroundImage: AssetImage(kDefaultAvatarImage),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 0.5,
              endIndent: 50,
              indent: 50,
            ),
            CustomListTile(
              leadingText: "Email",
              textValue: "amamdoh306@gmail.com",
            ),
            CustomListTile(
              leadingText: "Name",
              textValue: "Ahemed Mamdouh",
            ),
            CustomListTile(
              leadingText: "Gender",
              textValue: "Male",
            ),
            CustomListTile(
              leadingText: "Birth date",
              textValue: "2002-06-19",
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
