import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/helper/string_extension.dart';
import 'package:store_app/models/products_model.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SizedBox(
            height: 130,
            width: MediaQuery.sizeOf(context).width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: product.thumbnail!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title!,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  product.description!,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.category!.name
                      .replaceAll(RegExp('[^A-Za-z0-9]'), ' ')
                      .toLowerCase()
                      .capitalizeByWord(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "${product.price} \$",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Text(
                      "${product.rating} ",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Icon(
                      FontAwesomeIcons.solidStar,
                      size: 15,
                      color: Colors.amber,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
