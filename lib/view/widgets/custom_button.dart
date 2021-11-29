
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPress;
  final Color textColor;
  CustomButton({
    @required this.onPress,
    this.text = 'Write text ',
    this.color = PrimaryColor,
    this.textColor = Colors.white ,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      onPressed: onPress,
      color: color,
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        color: textColor,

      ),
    );
  }

}
