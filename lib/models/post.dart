import 'package:wigets_app_demo/services/services.dart';

class Post {
  String userId;
  String id;
  String title;
  String body;
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'] as String,
        id: json['id'] as String ,
        title: json['title'] as String,
        body: json['body'] as String);
  }
}
