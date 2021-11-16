import 'package:ecommerce/view/cart_view.dart';
import 'package:ecommerce/view/home_views.dart';
import 'package:ecommerce/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllViewModel extends GetxController{
  int _navigatorValue = 0 ;
  Widget _currentScreen = HomeView();

  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;

  void changeSelectedValue (int selected ){
    _navigatorValue = selected ;
    switch(selected){
      case 0 : {
        _currentScreen = HomeView();
        break;
      }
      case 1 :
        {
          _currentScreen = CartView();
          break;
        }
      case 2 :
        {
          _currentScreen = ProfileView();
          break;
        }

    }

    update();
  }
}