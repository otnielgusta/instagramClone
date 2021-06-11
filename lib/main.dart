import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black, scaffoldBackgroundColor: Colors.black),
      home: HomePage(),
    );
  }
}
