import 'package:flutter/material.dart';
import 'package:fort/common/widgets/Image_item.dart';
import 'package:fort/posts/model.dart';

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem(this.post);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            ImageItem(url: widget.post.imageUrl),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(widget.post.text),
            )
          ],
        ),
      ),
    );
  }
}
