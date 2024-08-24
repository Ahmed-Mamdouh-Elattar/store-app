import 'package:flutter/material.dart';
import 'package:store_app/constanst.dart';

class TakePersonalDataViewBody extends StatelessWidget {
  const TakePersonalDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              )
            ],
          ),
        )
      ],
    );
  }
}
