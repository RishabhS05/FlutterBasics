import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wigets_app_demo/models/api_response.dart';
import 'package:wigets_app_demo/models/post.dart';

import 'services/services.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var services = Services();
  APIResponse<List<Post>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Api Call"),
            centerTitle: true,
            backgroundColor: Colors.red[600]),
        body: Builder(builder:(_) {
      return _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: _apiResponse.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: Icon(Icons.delete),
              title: Text(_apiResponse.data[index].title +
                  "\n" +
                  _apiResponse.data[index].body),
              onTap: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text(_apiResponse.data[index].title)));
              },
            );
          });
  }
  ),
      floatingActionButton: FloatingActionButton(
          child: Text("+"),
          backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation : FloatingActionButtonLocation.centerFloat,);}

_fetchPosts() async {
  setState(() {
    _isLoading = true;
  });
  _apiResponse = await services.getPostList('posts');
  setState(() {
    _isLoading = false;
  });
}}
