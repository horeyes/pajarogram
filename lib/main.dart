import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:pajarogram/models/post_mock.dart';
import 'post_list.dart';
import 'package:pajarogram/models/post.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: "Pajarogram"),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        elevation: 0,
      ),
      body: PostsList(
          _loadPosts(context)), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
