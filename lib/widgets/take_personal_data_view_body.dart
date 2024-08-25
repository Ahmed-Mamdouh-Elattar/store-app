// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/cubits/cubit/user_data_cubit.dart';
import 'package:store_app/helper/navigation.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/views/home_view.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_circle_avatar.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class TakePersonalDataViewBody extends StatefulWidget {
  const TakePersonalDataViewBody({super.key});

  @override
  State<TakePersonalDataViewBody> createState() =>
      _TakePersonalDataViewBodyState();
}

class _TakePersonalDataViewBodyState extends State<TakePersonalDataViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? gender;
  XFile? image;
  Uint8List? imgPicker;
  String? imgUrl;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    CustomCircleAvatar(
                      imgPicker: imgPicker,
                      backgroundImage: imgPicker != null
                          ? MemoryImage(imgPicker!)
                          : const AssetImage(kDefaultAvatarImage),
                    ),
                    Positioned(
                      top: MediaQuery.sizeOf(context).width * 0.25 * 1.4,
                      left: MediaQuery.sizeOf(context).width * 0.25 * 1.5,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () async {
                          await pickImageFromGallery();
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: nameController,
                  hint: "Enter your name",
                  prefixIcon: Icons.person,
                  validator: (value) {
                    return Utils()
                        .validateTextFormField(value, "Please enter your name");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter your gender",
                    border: OutlineInputBorder(),
                  ),
                  value: gender,
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                  ],
                  validator: (value) {
                    return Utils().validateTextFormField(
                        value, "Please enter your gender");
                  },
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: birthDateController,
                  prefixIcon: Icons.date_range,
                  readOnly: true,
                  label: "Enter your birth date",
                  hint: "yyyy-mm-dd",
                  validator: (value) {
                    return Utils().validateTextFormField(
                        value, "Please enter your birth date");
                  },
                  onPressedTextFormField: () async {
                    await selectDate(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  title: "Submit",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      if (image != null) {
                        await uploadImgToFirebaseStorage(context);
                        uploadUserDataToFirebaseCloud();
                        BlocProvider.of<UserDataCubit>(context).getUserData();

                        Navigation().push(context, view: const HomeView());
                      } else {
                        Utils()
                            .showCustomDialog(context, text: "Image Missing");
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadUserDataToFirebaseCloud() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String uId = prefs.getString(kUserId) ?? "";
    String uEmail = prefs.getString(kUserEmail) ?? "";
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Map<String, dynamic> userData = {
      "user_id": uId,
      "user_email": uEmail,
      "name": nameController.text,
      "gender": gender,
      "birth_date": birthDateController.text,
      "image": imgUrl,
    };
    users.add(userData);
  }

  Future<void> uploadImgToFirebaseStorage(BuildContext context) async {
    formKey.currentState!.save();
    final storageRef = FirebaseStorage.instance.ref();
    final imgDirRef = storageRef.child("images");
    final refImgToUpload = imgDirRef.child(image!.name);
    await refImgToUpload.putFile(File(image!.path));
    imgUrl = await refImgToUpload.getDownloadURL();
  }

  Future<void> pickImageFromGallery() async {
    try {
      final ImagePicker img = ImagePicker();
      image = await img.pickImage(source: ImageSource.gallery);
      imgPicker = await image?.readAsBytes() ?? imgPicker;
    } on Exception catch (e) {}
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date set to today's date
      firstDate: DateTime(1900), // Earliest date that can be picked
      lastDate: DateTime.now(), // Latest date that can be picked
    );
    if (pickedDate != null) {
      setState(() {
        birthDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }
}
