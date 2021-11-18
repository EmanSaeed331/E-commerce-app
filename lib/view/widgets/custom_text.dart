
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int maxLine;
  final double width;
  final double height;
  final overflow;
  final textDirection ;
  CustomText({
    this.alignment = Alignment.topLeft,
    this.text =' ',
    this.fontSize= 16.0,
    this.color = Colors.black,
    this.maxLine ,
    this.width,
    this.height=1,
    this.overflow  =  TextOverflow.ellipsis,
    this.textDirection = TextDirection.ltr ,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
       child:
       Text(text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            height: height ,
              overflow:overflow,

          ),
       ),
    );
  }
}
