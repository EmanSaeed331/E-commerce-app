import 'package:ecommerce/core/helper/constance.dart';
import 'package:ecommerce/core/helper/enum.dart';
import 'package:ecommerce/view/controll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController{
  int get  index => _index;
  int _index = 0;
  Pages get pages =>_pages;
  Pages _pages = Pages.DeliveryTime;
  String Street1 , Street2 , city ;
  GlobalKey <FormState>formState = GlobalKey();
  void changeIndex (int i ){
    if(i == 1){
      _pages = Pages.AddAddress;
      _index =i;

    }
    else if (i == 2){
      formState.currentState.save();
      if(formState.currentState.validate()){
        _pages = Pages.Summary;
        _index =i;


      }
    }
    else if (i == 3)
      {
        Get.to(ControllView());
      }
    update();
  }

   Color getColor(int i) {
    if (i == index) {
      return inProgressColor;
    } else if (i < index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

}