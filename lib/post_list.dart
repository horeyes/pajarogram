import 'package:flutter/material.dart';
import 'package:pajarogram/post_item.dart';
import 'no_content.dart';
import 'package:pajarogram/models/post.dart';

class PostsList extends StatelessWidget {
  const PostsList(this._posts);

  final Stream<List<Post>> _posts;

//

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: _posts,
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading...');
          default:
            if (snapshot.data.isEmpty) {
              return const NoContent();
            }
            return _itemList(snapshot.data);
        }
      },
    );
  }

  ListView _itemList(List<Post> items) {
    return ListView(
      children: items.map((Post post) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0,8.0),
          child: PostItem(post),
        );
      }).toList(),
    );
  }
}
