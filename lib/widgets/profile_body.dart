import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/cubits/user_data_cubit/user_data_cubit.dart';
import 'package:store_app/models/user_model.dart';

import 'package:store_app/widgets/custom_circle_image.dart';
import 'package:store_app/widgets/custom_list_tile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        UserModel? user = BlocProvider.of<UserDataCubit>(context).userData!;
        return state is UserDataSuccess
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomCircleImage(
                        image: user.image,
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
              )
            : state is UserDataLoading
                ? const Center(child: CircularProgressIndicator())
                : const Center(
                    child: Text("There is an error try again later"));
      },
    );
  }
}
