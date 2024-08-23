import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/widgets/take_personal_data_view_body.dart';

class TakePersonalDataView extends StatelessWidget {
  const TakePersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(kAppBarTitle),
      ),
      body: const TakePersonalDataViewBody(),
    );
  }
}
