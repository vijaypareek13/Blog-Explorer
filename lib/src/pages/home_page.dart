
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'package:blogexplorer/src/pages/blog_page.dart';

import '../controllers/blogs_details_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blogControl = Get.find<BlogsDetailsController>();
    return Container(
        color: Colors.white,
        child: Obx(() {
          if (blogControl.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: Image.asset(
                    'assets/splash.png',
                    //width: 1000,
                    fit: BoxFit.contain,
                    height: 150,
                  ),
                ),
                body: const BlogPage());
          }
        }));
  }
}
