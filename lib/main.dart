import 'package:flutter/material.dart';
import 'package:spacey/loadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPACEY',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
