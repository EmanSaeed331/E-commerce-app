
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/serivice/firestore_user.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
List <CategoryModel> get categoryMddel => _categoryModel;
 List < CategoryModel>  _categoryModel = [];
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Categories');
HomeViewModel(){
  getCategorie();
}
  getCategorie() async{
    _collectionReference.get().then((value) {
    for(int i = 0 ; i <value.docs.length; i++ ){
      _categoryModel.add(CategoryModel.fromJson(value.docs[i].data()));
      print(_categoryModel.length);
    }
    update();
    });

  }

}