import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/controllers/blogs_details_controller.dart';
import 'src/helpers/constants.dart';
import 'src/helpers/routes.dart';
import 'src/pages/dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //It is used for taskbar color on the top of the app

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // Blog Controller

  final BlogsDetailsController blogsDetailsController =
      Get.put(BlogsDetailsController());
  //blogsDetailsController.fetchBlogs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Const.appName,
        getPages: allPages,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const DashBoardPages());
  }
}
