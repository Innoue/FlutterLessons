import 'dart:io';
import '../apps/app_ios.dart' as ios;
import '../apps/app_android.dart' as android;
import 'package:flutter/cupertino.dart';

void main() {
  if (Platform.isIOS){
    runApp(const ios.MyApp());
  }else{
    runApp(const android.MyApp());
  }
}
