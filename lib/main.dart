import 'package:flutter/material.dart';
import 'package:flutter_uikit/pages/splash_page.dart';
import 'package:flutter_uikit/util/const.dart';
import 'package:flutter_uikit/util/theme_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: true,

      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      home: SplashPage()
    );
  }

//  ThemeData themeData(ThemeData theme) {
//    return theme.copyWith(textTheme: )
//  }
}
