import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:blogexplorer/src/model/news_model.dart';

class APIService {
  fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        if (kDebugMode) {
        //  print('Response data: ${response.body}');
        }
        final data = response.body;
        //extract blogs valus from amp and conver List json to NewsMode object
        final blogs = json.decode(data)['blogs']
            .map<NewsModel>((json) => NewsModel.fromJson(json))
            .toList();
          

        if (kDebugMode) {
          print(blogs);
        }

        if (kDebugMode) {
         // print('Data: $data');
        }

        return blogs;
      } else {
        // Request failed
        if (kDebugMode) {
          print('Request failed with status code: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response data: ${response.body}');
        }
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
