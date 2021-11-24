
import 'package:ecommerce/core/helper/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilfViewModel extends GetxController{
  LocalStorageData localStorageData = Get.find();
  Future<void> Signout () async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();

  }
}