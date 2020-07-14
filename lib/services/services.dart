import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wigets_app_demo/models/api_response.dart';
class Services {
  static final Services _instance = Services._internal();
  factory Services() => _instance;
  Services._internal(); // private Constructor

  final String baseUrl = 'https://jsonplaceholder.typicode.com/';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<APIResponse> getPostList(String path) async {
    return APIResponse.fromResponse(await http.get(baseUrl + path, headers: headers));
  }
}