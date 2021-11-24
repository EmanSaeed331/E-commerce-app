import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder <ProfileViewModel>(
        init : ProfileViewModel(),
    builder:(controller) =>Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: (){
              controller.Signout();
              Get.offAll(LoginScreen());
            },

            child: Text('SignOut'),
          ),
        ),

      ),

    ),
    );
  }
}
