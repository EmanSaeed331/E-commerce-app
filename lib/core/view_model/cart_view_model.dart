import 'package:ecommerce/core/serivice/database/cart_database_helper.dart';
import 'package:ecommerce/model/carrt_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier <bool> get  loadign => _loading ;
  ValueNotifier <bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel =>_cartProductModel;
  double get totalPrice => _totalPrice;
  double _totalPrice =0.0;
  CartViewModel (){

    getAllProduct();
  }
  getAllProduct() async {
      _loading.value = true;
      var dbHelper = CartDataBaseHelper.db;
      _cartProductModel= await dbHelper.getAllProduct();
      print('prokkdss+${_cartProductModel.length}');


      _loading.value =false;
      getTotalPrice();

      update();
  }
  getTotalPrice(){
    for (int i =0 ; i<_cartProductModel.length ; i++) {

      _totalPrice +=(double.parse(_cartProductModel[i].price)
          * _cartProductModel[i].quantity);
      print('priceeeeee+${_totalPrice}');
      update();

    }
  }
  addProduct (CartProductModel cartProductModel) async {

    for(int i = 0 ; i<_cartProductModel.length ; i++){
      if(_cartProductModel[i].productId == cartProductModel.productId){
        return;
      }

  }
    var  dbHelper = CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);

    _totalPrice +=(double.parse(cartProductModel.price)
        * cartProductModel.quantity);


    update();
  }
  increaseQuatity(int index){
    _cartProductModel[index].quantity++;
    _totalPrice +=(double.parse(_cartProductModel[index].price));
    update();
  }
  decreaseQuatity(int index){
    _cartProductModel[index].quantity--;
    _totalPrice -=(double.parse(_cartProductModel[index].price));
    update();
  }

}