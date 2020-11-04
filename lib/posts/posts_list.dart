import 'package:flutter/material.dart';
import 'package:fort/posts/model.dart';
import 'package:fort/posts/post_item.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, index) {
        return PostItem(posts[index]);
      },
    );
  }
}
