import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/widgets/custom_button.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: MediaQuery.sizeOf(context).width * 0.3,
                child: Stack(
                  children: [
                    Image.asset(kDefaultAvatarImage),
                    Positioned(
                      top: MediaQuery.sizeOf(context).width * 0.3 * 1.3,
                      left: MediaQuery.sizeOf(context).width * 0.3 * 1.3,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
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
                    child: Text('Female'),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Text('Female'),
                  ),
                ],
                validator: (value) {
                  return Utils()
                      .validateTextFormField(value, "Please enter your gender");
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
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
