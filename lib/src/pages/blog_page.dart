import 'package:blogexplorer/src/controllers/blogs_details_controller.dart';
import 'package:blogexplorer/src/widgets/blog_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({
    super.key,
  });
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollController = ScrollController();
  // blog controller
  final blogsDetailsController = Get.find<BlogsDetailsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blogsDetailsController = Get.find<BlogsDetailsController>();
    return blogsList(blogsDetailsController);
  }

  Widget blogsList(blogsDetailsController) {
    return Obx(() {
      if (blogsDetailsController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: blogsDetailsController.blogsList.length,
            itemBuilder: (context, index) {
              return BlogCardWidget(
                  model: blogsDetailsController.blogsList[index]);
            });
      }
    });
  }
}
