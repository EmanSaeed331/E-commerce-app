import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/register_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_social.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends GetWidget<AuthViewModel> {
final GlobalKey <FormState> _formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
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
                      text: 'Welcome',
                      fontSize: 30,

                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                      text: 'Sign Up',
                        color:PrimaryColor,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                CustomSizedBox(height: 15),
                CustomText(
                  text: 'Sign in to continue',
                  color: Colors.grey,
                ),
                CustomSizedBox(height: 30),
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
                  hintText: '*******************',
                  onSaved: (value){
                    controller.password = value;
                  },
                  validator: (value){},
                ),
                CustomSizedBox(
                  height: 15.0,
                ),
                CustomText(
                  text: 'Forget Password ? ',
                  fontSize: 14,
                  alignment:Alignment.topRight,
                ),
              CustomSizedBox(height: 15,),
                CustomButton(
                  onPressed: (){
                    _formKey.currentState.save();
                    controller.SignInWithEmailAndPassword();

                  },

                  text: 'Sign In',
                ),
                CustomSizedBox(height: 15,),
                CustomText(
                  alignment: Alignment.center,
                  text: '-OR-',
                ),
                CustomSocial(
                  text: 'Sign in with google',
                  image: 'assets/images/google.png',
                  onPressed: (){
                    controller.SignInWithGoogleMethod();
                  },
                ),
                CustomSizedBox(height: 10,),
                CustomSocial(
                  onPressed: (){
                    controller.SignInWithFacebook();
                  },
                  text: 'Sign in with facebook',
                  image: 'assets/images/facebook.png',
                ),
              ],

            ),
          ),

        ),
      ),

    );
  }
}
