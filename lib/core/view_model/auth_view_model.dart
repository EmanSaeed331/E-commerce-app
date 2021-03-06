
import 'package:ecommerce/core/helper/local_storage_data.dart';
import 'package:ecommerce/core/serivice/firestore_user.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/controll_view.dart';
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
  LocalStorageData localStorageData =Get.find();
  FirebaseAuth _auth = FirebaseAuth.instance ;
  Rx<User> _user = Rxn<User>();
  String   get user=> _user.value?.email;
  @override

  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());

    if(_auth.currentUser != null){
      getCurrentUserData(_auth.currentUser.uid);

    }
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
   _auth.signInWithCredential(credential).then((user) {
     SaveData(user);
     Get.offAll(ControllView());
   });
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
        Get.offAll(ControllView());
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
     await _auth
         .signInWithEmailAndPassword(email: email, password: password)
         .then((user) async {
      // Get.to(ControllView());
       getCurrentUserData(user.user.uid);

       //SaveData(user);
       Get.offAll(ControllView());
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
 void getCurrentUserData(String uid) async {
   await FireStoreUser()
       .getCurrentUser( uid)
       .then((value) => setUser1(UserModel.fromJson(value.data()))
   );
 }
void setUser1 (UserModel userModel) async{
    await localStorageData.Setuser(userModel);
}

}