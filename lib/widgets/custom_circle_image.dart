import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        height: MediaQuery.sizeOf(context).width * 0.5,
        width: MediaQuery.sizeOf(context).width * 0.5,
        fit: BoxFit.cover,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
