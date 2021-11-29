import 'dart:core';

import 'package:ecommerce/model/carrt_product_model.dart';

class OrderModel {
  String userId, dateTime;
  Address address;
  List <CartProductModel> products;
  OrderModel({this.userId,this.dateTime , this.address  , this.products});

  factory OrderModel.fromMap(Map<String,dynamic> map){
    return new OrderModel(
      userId: map['uderId'] as String ,
      dateTime: map['dateTime'] as String ,
      address : map ['address'] as Address ,
      products : map['products'] as List<CartProductModel>,
    );
  }
}

class Address {
  String street1, Street2, city;
  Address({this.street1, this.Street2, this.city});


  factory Address.fromMap(Map<String , dynamic> map){
    return new Address(
      street1: map['street1'] as String ,
      Street2: map['street2'] as String ,
      city: map['city'] as String ,

    );
  }
  Map<String ,dynamic>toMap(){
    return{
      'street1':this.street1,
      'street2':this.Street2,
      'city':this.city,

    };
  }
}
