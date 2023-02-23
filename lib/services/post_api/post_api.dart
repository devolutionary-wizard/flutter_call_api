import 'package:flutter_call_api/services/base.dart';
import 'package:flutter_call_api/utils/toast_message.dart';

import '../../models/post_model.dart';

class PostApi extends Base {
  Future<List<PostModel>> getPosts(String url) async {
    var res = await get(url);
    List<PostModel> posts =
        List<PostModel>.from(res.map((x) => PostModel.fromJson(x)));
    ToastMessage().logJson("List Post", posts);
    return posts;
  }
}
