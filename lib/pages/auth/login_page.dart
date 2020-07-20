import 'package:flutter/material.dart';
import 'package:flutter_uikit/pages/main_page.dart';

import '../../util/const.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  final String email;
  LoginPage({
    @required this.email
  });
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  bool validate = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String emali = '';
  String password = '';

  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();

  /// 登录
  login() async {
    FormState form = formKey.currentState;
    form.save();
    
    if(!form.validate()) {
      validate = true;
      setState(() {
        
      });
      showSnackBar('Please fix the errors in red before submitting.');
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        return MainPage();
      }));
    }
  }
  
  showSnackBar(String value) {
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('$value')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildHero(),
              _buildForm(),
              _buildButton()
            ],
          ),
        ),
      ),
    );
  }

  _buildHero() {
    return Hero(
      tag: 'appname',
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          '${Constants.appName}',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  _buildForm() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Form(
        autovalidate: validate,
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomTextField(
              enabled: false,
              hintText: 'jideguru@gmail.com',
              textInputAction: TextInputAction.next,
              validateFunction: (String value) {

              },
              onSaved: (String val) {
                emali = val;
              },
              initValue: widget.email,
              focusNode: emailFN,
              nextFocusNode: passFN,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              enabled: !loading,
              hintText: 'Password',
              textInputAction: TextInputAction.done,
              validateFunction: (String val) {

              },
              submitAction: login,
              obscureText: true,
              onSaved: (String val) {
                password = val;
              },
              focusNode: passFN,
            )
          ],
        ),
      ),
    );
  }

  _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: loading ? Center(child: CircularProgressIndicator()) :
        CustomButton(
          label: '登录',
          onPressed: login,
        ),
    );
  }
}
