import 'package:ecommerce/core/helper/ex.dart';
import 'package:flutter/material.dart';

class CartProductModel {
  String name, image, price ,productId;
  int quantity;

  CartProductModel(
      {this.name,
        this.image,
        this.quantity,
        this.price,
        this.productId,
      });

  CartProductModel.fromJson(Map <dynamic,dynamic> map ){
    if (map == null ){
      return ;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productId=map['productId'];

  }
  toJson(){
    return {
      'name':name,
      'image':image,
      'price':price,
      'quantity':quantity,
      'productId':productId

    };
  }

}
