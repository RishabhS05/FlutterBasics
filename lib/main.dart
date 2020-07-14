import 'package:flutter/material.dart';
import 'package:wigets_app_demo/models/api_response.dart';
import 'package:wigets_app_demo/models/post.dart';

import 'services/services.dart';
void main() {

  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  var services = Services();
  APIResponse<List<Post>> _apiResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Wigets"),
          centerTitle: true,
          backgroundColor: Colors.red[600]),
      body: Center(),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  _fetchPosts() async{
   _apiResponse=  await services.getPostList('/posts');
  }
}
