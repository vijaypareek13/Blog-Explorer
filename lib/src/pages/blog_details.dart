import 'package:blogexplorer/src/controllers/blogs_details_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogsDetailsController blogsDetailsController =
        Get.find<BlogsDetailsController>();
    final arguments = Get.arguments;
    Future.delayed(Duration.zero, () async {
      //print("Get argument sahi hai" + Get.arguments.toString());
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (blogsDetailsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: backgroundImage(arguments),
              ),
              Expanded(
                flex: 3,
                child: newsDetailSection(arguments),
              ),
            ],
          );
        }
      }),
    );
  }

  Widget backgroundImage(argumnets) {
    if (argumnets.imageUrl == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Image.network(
          argumnets.imageUrl ??
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png",
          fit: BoxFit.cover);
    }
  }

  Widget newsDetailSection(arguments) {
    return Scrollbar(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            row1(),
            const SizedBox(height: 15),
            Text(
              arguments.title ?? "title",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            const SizedBox(
                width: 100.0,
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                )),
          ],
        ),
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: const Icon(Icons.bookmark_border, color: Colors.white),
          onTap: () {},
        ),
        GestureDetector(
          child: const Icon(Icons.favorite, color: Colors.red),
          onTap: () {},
        )
      ],
    );
  }
}
