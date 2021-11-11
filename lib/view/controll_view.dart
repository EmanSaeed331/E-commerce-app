import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:ecommerce/view/home_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllView extends GetWidget<AuthViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx( (){

      return (Get.find<AuthViewModel>().user !=null)
          ?HomeView()
          :LoginScreen();

    });
  }
}
