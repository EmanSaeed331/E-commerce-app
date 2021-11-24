import 'dart:convert';

import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{

  //method 1 to set user
  Future <UserModel> get getUser async {
    try {
      UserModel userModel = await _getUser();
      if (userModel == null)
        return null;
      return userModel;
    }
    catch(e){
      print(e.toString());
      return null;
    }

    }
    }

  
  _getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED_USER_DATA);
    //await prefs.getString(CACHED_USER_DATA,json.decode(source))
    return UserModel.fromJson(json.decode(value));

  }
  setUser(UserModel userModel) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }
  //method 2 to get user data from local storage
