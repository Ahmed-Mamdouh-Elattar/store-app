import 'dart:typed_data';

import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.imgPicker,
    this.backgroundImage,
  });

  final Uint8List? imgPicker;
  final ImageProvider<Object>? backgroundImage;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).width * 0.25,
      backgroundImage: backgroundImage,
    );
  }
}
