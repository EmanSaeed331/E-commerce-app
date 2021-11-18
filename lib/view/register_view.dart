import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_social.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>() ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        leading: GestureDetector(
          onTap: (){
            Get.off(LoginScreen());
          },
            child: Icon(Icons.arrow_back ,color:Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top:50,
            right: 20,
            left: 20,
          ),
          child: Form(
            key:_formKey,
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Sign Up',
                      fontSize: 30,

                    ),
                  ],
                ),
                CustomSizedBox(height: 15),
                CustomSizedBox(height: 30),
                CustomTextFormField(
                  text: 'Name',
                  hintText: 'Name',
                  onSaved: (value){
                    controller.name = value;
                  },
                  validator: (value){},


                ),
                CustomSizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hintText: 'Email@gmail.com',
                  onSaved: (value){
                    controller.email = value;
                  },
                  validator: (value){},
                ),
                CustomSizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(

                  text: 'Password',
                  hintText: '******',
                  onSaved: (value){
                    controller.password = value;
                  },
                  validator: (value){},
                ),

                CustomSizedBox(height: 15,),
                CustomButton(
                  onPress: (){
                    _formKey.currentState.save();
                    controller.createEmailandPassword();

                  },

                  text: 'Sign Up ',
                ),
                CustomSizedBox(height: 15,),
              ],

            ),
          ),

        ),
      ),

    );
  }
}
