import 'package:wigets_app_demo/models/post.dart';

class PostList {
  List<Post> postList;

  PostList({this.postList});

  factory PostList.fromJson(dynamic data) {
    var list = <Post>[];
    for (var items in data) {
      list.add(Post.fromJson(items));
    }
    return PostList(postList: list);
  }
}
