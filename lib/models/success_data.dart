import 'package:wigets_app_demo/models/postList.dart';
import 'package:wigets_app_demo/services/services.dart';

class SuccessData {
  static final SuccessData _instance = SuccessData._internal();

  factory SuccessData() => _instance;

  SuccessData._internal();

  Future<PostList> getPostListData() async {
    var data = await Services()
        .getPostList("posts")
        .then((value) => PostList.fromJson(value.data));
    return data;
  }
}
