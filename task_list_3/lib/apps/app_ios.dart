import 'package:flutter/cupertino.dart';
import 'package:task_list_3/pages/home_page_ios.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}