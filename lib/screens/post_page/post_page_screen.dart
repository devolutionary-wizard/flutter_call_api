import 'package:flutter/material.dart';
import 'package:flutter_call_api/services/post_api/post_api.dart';
import 'package:flutter_call_api/utils/loading_page.dart';

import '../../models/post_model.dart';

class PostPageScreen extends StatefulWidget {
  const PostPageScreen({Key? key}) : super(key: key);

  @override
  State<PostPageScreen> createState() => _PostPageScreenState();
}

class _PostPageScreenState extends State<PostPageScreen> {
  List<PostModel> _listPost = <PostModel>[];
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    PostApi().getPosts('https://jsonplaceholder.typicode.com/posts').then(
        (List<PostModel> value) =>
            {_listPost = value, isLoading = false, setState(() {})});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Page'),
        ),
        body: isLoading
            ? LoadingPage(
                check: true,
              )
            : ListView.builder(
                itemBuilder: (context, index) => Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //User ID
                      Text("User ID: ${_listPost[index].userId}"),
                      Text("Title: ${_listPost[index].title}"),
                      Text("Body: ${_listPost[index].body}"),
                    ],
                  ),
                ),
                itemCount: _listPost.length,
              ));
  }
}
