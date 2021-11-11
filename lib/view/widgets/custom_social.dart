import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
class CustomSocial extends StatelessWidget {
  final String text;
  final String image;
  final Function onPressed;
  CustomSocial({this.text , this.image , this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100
        ),
     child: FlatButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Image.asset(image),
            CustomSizedBox(width: 40 ,),
            CustomText(
              text:text ,),
          ],
        ),
      ),

    );
  }
}
