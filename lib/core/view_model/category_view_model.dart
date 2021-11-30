
import 'package:ecommerce/core/serivice/category_services.dart';
import 'package:ecommerce/model/category_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController{
  ValueNotifier <bool> get loading =>_loading;
  ValueNotifier <bool> _loading = ValueNotifier(false);

  List <CategoryProductModel> get categoryProductModel => _categoryProductModel;
  List <CategoryProductModel> _categoryProductModel = [];
  CategoryViewModel(){
    getCategoryProduct();
    print(categoryProductModel.length);
    }

  getCategoryProduct()async{
    _loading.value = true;
    CategoryServices().getMenCategory().then((value)  async {
      for(int i =0 ; i < value.length ; i++)
      {
       await  _categoryProductModel.add(CategoryProductModel.fromJson(value[i].data()));
         _loading.value = false;

        }
      update();

    });

  }

}

