import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/cubits/cubit/user_data_cubit.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/widgets/custom_circle_avatar.dart';
import 'package:store_app/widgets/custom_list_tile.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit, UserDataState>(
      listener: (context, state) {
        if (state is UserDataSuccess) {
          user = BlocProvider.of<UserDataCubit>(context).userData!;
        }
      },
      builder: (context, state) {
        return state is UserDataSuccess
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomCircleAvatar(
                        backgroundImage: NetworkImage(user!.image),
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
                        textValue: user!.email,
                      ),
                      CustomListTile(
                        leadingText: "Name",
                        textValue: user!.name,
                      ),
                      CustomListTile(
                        leadingText: "Gender",
                        textValue: user!.gender,
                      ),
                      CustomListTile(
                        leadingText: "Birth date",
                        textValue: user!.birthDate,
                      ),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
