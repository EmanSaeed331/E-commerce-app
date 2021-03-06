
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/serivice/firestore_user.dart';
import 'package:ecommerce/core/serivice/home_services.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier <bool> _loading = ValueNotifier(false);

List <CategoryModel> get categoryMddel => _categoryModel;
 List < CategoryModel>  _categoryModel = [];

  List <ProductModel> get productModel => _productModel;
  List < ProductModel>  _productModel = [];
  // final CollectionReference _collectionReference =
  //     FirebaseFirestore.instance.collection('Categories');
HomeViewModel(){
  getCategorie();
  getBestSellingProducts();
}
  getCategorie() async{
  _loading.value = true;
    HomeServices().getCategory().then((value) {
    for(int i = 0 ; i <value.length; i++ ){
      _categoryModel.add(CategoryModel.fromJson(value[i].data()));
      _loading.value = false;

    }
    update();
    });

  }
  getBestSellingProducts () async {
    _loading.value = true;
    HomeServices().getBestSelling().then((value) {
      for(int i =0 ; i <value.length ; i++){
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      print(_productModel.length);
      update();


    });
  }
}