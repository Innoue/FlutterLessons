import 'package:flutter/material.dart';
import '../pages/home_page_android.dart';
import '../pages/new_task_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: NewTask(),
    );
  }
}