
import 'package:ecommerce/core/serivice/firestore_user.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/home_views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthViewModel extends GetxController{
 GoogleSignIn _googleSignIn = GoogleSignIn(scopes:['email']);
 String email , password , name ;
  //GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseAuth _auth = FirebaseAuth.instance ;
  Rx<User> _user = Rxn<User>();
  String   get user=> _user.value?.email;
  @override

  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
  super.onReady();
  }

  @override
  void onClose()
  {

  }
  void SignInWithGoogleMethod () async{
   final googleUser  =  await _googleSignIn.signIn();
   GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
  final AuthCredential credential=  GoogleAuthProvider.credential(
     idToken: googleSignInAuthentication.idToken,
     accessToken: googleSignInAuthentication.accessToken,
   );
  print('Credintional '+'${credential}');
   _auth.signInWithCredential(credential);
  }


  void SignInWithFacebook() async {
    var fbLogin = FacebookLogin();

    var result = await fbLogin.logIn(customPermissions: ['email']);

    if (result.status == FacebookLoginStatus.success) {
      FacebookAccessToken myToken = result.accessToken;
      AuthCredential credential =
      FacebookAuthProvider.credential(myToken.token);

      var user = await _auth.signInWithCredential(credential).then((user) async
      {
        SaveData(user);
        Get.offAll(HomeView());
      }
      );
      print(user);

    }
    else{
      print('error+++'+'${result.error}');
    }
  }
  void SignInWithEmailAndPassword() async{
    try {
     await _auth.signInWithEmailAndPassword(email: email, password: password).then((user) {
      // Get.to(HomeView());
       SaveData(user);
       Get.offAll(HomeView());
;       print(user);
     }).catchError((error){
       print(error.toString());
     });
    }
    catch(e){
      print(e.message);
      Get.snackbar(
        'Error While Logging in',
         e.message,
         colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }
 void createEmailandPassword() async{
   try {
     await _auth.createUserWithEmailAndPassword(email: email, password: password ).then((user) async {

       SaveData(user);
           Get.offAll(HomeView());

     }).catchError((error){
       print(error.toString());
     });
   }
   catch(e){
     print(e.message);
     Get.snackbar(
       'Error While Logging in',
       e.message,
       colorText: Colors.black,
       snackPosition: SnackPosition.BOTTOM,

     );
   }
 }
 void SaveData (UserCredential user) async {
   await FireStoreUser ().addUserToFireStore(UserModel(
     userId: user.user.uid,
     email : user.user.email,
     name:  name == null ? user.user.displayName : name  ,
     pic: '',

   ));
 }


}