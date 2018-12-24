import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:pajarogram/pages/home_page.dart';
import 'package:pajarogram/pages/register_page.dart';
import 'theme.dart';

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
      theme: buildThemeData(),
      home: const MyHomePage(title: 'Pajarogram'),
      routes: <String, WidgetBuilder>{
        RegisterPage.routeName: (BuildContext context) => const RegisterPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}