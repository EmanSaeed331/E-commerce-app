import 'package:ecommerce/core/serivice/database/cart_database_helper.dart';
import 'package:ecommerce/model/carrt_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier <bool> get  loadign => _loading ;
  ValueNotifier <bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductMode = [];
  List<CartProductModel> get cartProductModel =>_cartProductMode;
  CartViewModel (){getAllProduct();}
  getAllProduct() async {
      _loading.value = true;
      var dbHelper = CartDataBaseHelper.db;
      _cartProductMode= await dbHelper.getAllProduct();
      print('prokkdss+${_cartProductMode.length}');


      _loading.value =false;
      update();
  }
  addProduct (CartProductModel cartProductModel) async {
  if(_cartProductMode.length == 0 ){
    var  dbHelper = CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);
  }
  else{
    for(int i = 0 ; i<_cartProductMode.length ; i++){
      if(_cartProductMode[i].productId == cartProductModel.productId){
        return;
      }
      else{
        var  dbHelper = CartDataBaseHelper.db;
        await dbHelper.insert(cartProductModel);
      }
  }

  }

    update();
  }

}