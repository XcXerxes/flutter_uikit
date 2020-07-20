import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String label;
  final Function onPressed;
  final Color color;

  CustomButton({
    this.label = '确认',
    this.onPressed,
    this.color
  });

  bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        color: color ?? Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Text(
          '$label',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
