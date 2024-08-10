import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/news_model.dart';
import '../pages/blog_details.dart';

class BlogCardWidget extends StatelessWidget {
  final NewsModel model;
  const BlogCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        onTap: () {
          // Get.to(NewsDetails(), arguments: model.id);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const NewsDetails(), arguments: model);
                  },
                  child: ClipRRect(
                    // child: Image.network(model.imageURL!),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    // child: Image.network(model.imageURL!),
                    child: CachedNetworkImage(
                      imageUrl: model.imageUrl,
                      placeholder: (context, url) =>
                          Image.asset('assets/logo.png'),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/logo.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Bookmark Icon
                      GestureDetector(
                        child: const Icon(Icons.bookmark_border,
                            color: Colors.white),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: const Icon(Icons.favorite, color: Colors.red),
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
