import 'package:flutter/material.dart';
import 'package:flutter_uikit/pages/auth/login_page.dart';
import 'package:flutter_uikit/util/const.dart';
import 'package:flutter_uikit/widget/custom_button.dart';
import 'package:flutter_uikit/widget/custom_text_field.dart';

class CheckEmailPage extends StatefulWidget {
  @override
  _CheckEmailPageState createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool validate = false;
  bool loading = false;
  String email = '';

  checkEmail() async {
    FormState form = formKey.currentState;
    form.save();
    showSnackBar('Please fix the errors in red before submitting.');
    if(!form.validate()) {
      validate = true;
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage(email: email);
      }));
    }
  }

  showSnackBar(String value) {
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Hero(
                  tag: 'appname',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      '${Constants.appName}',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              _buildTitle(),
              _buildForm(),
              _buildButton()
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 12),
      child: Text(
        'Please input your email address',
        style: TextStyle(
          fontSize: 15
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
      autovalidate: validate,
      key: formKey,
      child: CustomTextField(
        enabled: !loading,
        hintText: 'jideguru@gmail.com',
        textInputAction: TextInputAction.done,
        validateFunction: (String value) {

        },
        submitAction: checkEmail,
        onSaved: (String val) {
          email = val;
        },
      ),
    );
  }

  _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: loading ? Center(
        child: CircularProgressIndicator(),
      ) : CustomButton(
        onPressed: checkEmail,
      ),
    );
  }
}
