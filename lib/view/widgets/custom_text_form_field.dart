
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final Function onSaved,validator;

  CustomTextFormField({
    this.hintText,
    this.text,
    this.onSaved,
    this.validator,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          CustomText(
            text:text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved:onSaved ,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color:Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          ),

        ],
      ),

    );
  }
}
