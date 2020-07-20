import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String initValue;
  final bool enabled;
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode, nextFocusNode;
  final VoidCallback submitAction;
  final bool obscureText;
  final FormFieldValidator<String> validateFunction;
  final void Function(String) onSaved, onChange;

  CustomTextField({
    this.initValue,
    this.enabled,
    this.hintText,
    this.textInputType,
    this.controller,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.obscureText = false,
    this.validateFunction,
    this.onSaved,
    this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        initialValue: initValue,
        enabled: enabled,
        onChanged: onChange,
        style: TextStyle(
          fontSize: 15
        ),
        obscureText: obscureText,
        keyboardType: textInputType,
        validator: validateFunction,
        onSaved: onSaved,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: (String term) {
          if(nextFocusNode != null) {
            focusNode.unfocus();
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else {
            submitAction();
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400]
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          border: border(),
          focusedBorder: border(),
          disabledBorder: border()
        ),
      ),
    );
  }

  border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xffb3abab),
        width: 1.0
      )
    );
  }
}
