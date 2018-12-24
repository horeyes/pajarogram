import 'package:flutter/material.dart';
import 'package:pajarogram/models/post.dart';
import 'package:pajarogram/models/post_mock.dart';
import 'package:pajarogram/post_list.dart';
import 'package:pajarogram/sign_in_fab.dart';
import 'package:pajarogram/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<List<Post>> _loadPosts(BuildContext context) {
    final List<List<dynamic>> mockSnapshot = <List<dynamic>>[
      List<dynamic>.generate(10, (int index) => mockPostData(index: index))
    ];

    return Stream<List<dynamic>>.fromIterable(mockSnapshot)
        .map(_convertToPosts);
  }

  List<Post> _convertToPosts(List<dynamic> data) {
    return data.map((dynamic item) => Post.fromMap(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        elevation: 0,
      ),
      body: PostsList(_loadPosts(context)),
      floatingActionButton: SignInFab(
        auth: Auth(
            googleSignIn: GoogleSignIn(), firebaseAuth: FirebaseAuth.instance),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }





}
