
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text ;
  final Function onPressed;
  CustomButton({this.text,this.onPressed});


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)

      ),
      padding: EdgeInsets.all(15),
      onPressed:onPressed,

      color: PrimaryColor,
      child:
      CustomText(
        alignment: Alignment.center,
        text: text,
        color: Colors.white,

      ),
    );
  }
}
