import 'package:get/get.dart';

import '../services/api_services.dart';

class BlogsDetailsController extends GetxController {

  var isLoading = true.obs;
  var blogsList = [].obs;

  @override
  void onInit() {
    fetchBlogs();
    super.onInit();
  }

  void fetchBlogs() async {
    try {
      isLoading(true);
      var blogs = await APIService().fetchBlogs();
      if (blogs != null) {
        blogsList.assignAll(blogs);
      }
    } finally {
      isLoading(false);
    }
  }
  

}
