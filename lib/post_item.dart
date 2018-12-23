import 'package:flutter/material.dart';
import 'package:pajarogram/models/post.dart';

class PostItem extends StatelessWidget {
  const PostItem(this.post);
  final Post post;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card (
      child: Container(
        height: 100.0,
        child:  Center(
          child:  Text(post.username),
        ),
      ),
    );
  }
}