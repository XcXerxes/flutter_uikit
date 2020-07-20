import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_uikit/pages/auth/check_email_page.dart';
import 'package:flutter_uikit/util/const.dart';
import 'package:flutter_uikit/widget/animations/fade_page_route.dart';
import 'package:flutter_uikit/widget/animations/type_write.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1200), () {
      Navigator.pushReplacement(context, FadePageRoute(CheckEmailPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Center(
            child: Hero(tag: 'appname', child: Material(
              type: MaterialType.transparency,
              child: TypeWrite(
                word: '${Constants.appName}',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
                seconds: 1,
              ),
            )),
          )
        ],
      ),
    );
  }
}
