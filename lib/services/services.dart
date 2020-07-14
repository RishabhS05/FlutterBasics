import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wigets_app_demo/models/api_response.dart';
import 'package:wigets_app_demo/models/post.dart';

class Services {
  static final Services _instance = Services._internal();
  factory Services() => _instance;
  Services._internal(); // private Constructor

  final String baseUrl = 'https://jsonplaceholder.typicode.com/';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<APIResponse<List<Post>>> getPostList(String path) async {
    return http.get(baseUrl + path, headers: headers).then((data) {
      if (data.statusCode >=200 && data.statusCode<=299) {
        final jsonData = json.decode(data.body);
        final posts = <Post>[];
        for (var item in jsonData) {
          posts.add(Post.fromJson(item));
        }
        return APIResponse<List<Post>>(data: posts);
      }
      return APIResponse<List<Post>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Post>>(error: true, errorMessage: 'An error occured'));
  }
}