import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder <ProfileViewModel>(
      init : ProfileViewModel(),
    builder:(controller) => controller.loading.value ? Center(child: CircularProgressIndicator())
        :Scaffold(
      body: Container(
        padding:EdgeInsets.only(
          top: 50,
        ) ,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                            Radius.circular(100),
                        ),
                        // image: DecorationImage(
                        //   image: controller.userModel.pic = null
                        //       ? AssetImage(
                        //         'assets/images/Avatar.png',
                        //       )
                        //         :controller.userModel.pic == 'default'
                        //           ? AssetImage('assets/images/Avatar.png') :
                        //             NetworkImage(controller.userModel.pic)
                        // )
                        image: DecorationImage(
                          image: controller.userModel == null
                              ? const AssetImage('assets/images/Petra.jpg')
                              :controller.userModel.pic == 'default'
                                ? const AssetImage('assets/images/Petra.jpg')
                                :NetworkImage(
                                    controller.userModel.pic,
                                     ),
                          fit: BoxFit.fill
                        ),
                      ),

                    ),
                      // FlatButton(onPressed: (){
                      //   controller.Signout();
                      //   Get.offAll(LoginScreen());
                      // },
                      //     child: Text('Sign out'),
                      //
                      // ),
                      Column(
                        children: [
                          CustomText(
                            text: controller.userModel.name,
                            color: Colors.black,
                            fontSize: 32,

                          ),
                          CustomText(
                            text: controller.userModel.email,
                            color: Colors.black,
                            fontSize: 13,

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomSizedBox(
                  height: 100,
                ),
                Container(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title:CustomText(
                        text: 'Shipping Address',
                      ) ,
                      leading:Image.asset('assets/images/Group 185.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color:Colors.black,
                      ),
                    ),
                  ),

                ),
                CustomSizedBox(
                  height: 10,

                ),
                Container(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title:CustomText(
                        text: 'Order History',
                      ) ,
                      leading:Image.asset('assets/images/Group 194.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color:Colors.black,
                      ),
                    ),
                  ),

                ),
                CustomSizedBox(
                  height: 10,

                ),
                Container(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title:CustomText(
                        text: 'Cards',
                      ) ,
                      leading:Image.asset('assets/images/Group 197.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color:Colors.black,
                      ),
                    ),
                  ),

                ),
                CustomSizedBox(
                  height: 10,

                ),
                Container(
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: ListTile(
                      title:CustomText(
                        text: 'Notification',
                      ) ,
                      leading:Image.asset('assets/images/Group 198.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color:Colors.black,
                      ),
                    ),
                  ),

                ),
                CustomSizedBox(
                  height: 10,

                ),
                Container(
                  child: FlatButton(
                    onPressed: (){
                      controller.Signout();
                    },
                    child: ListTile(
                      title:CustomText(
                        text: 'Log out ',
                      ) ,
                      leading:Image.asset('assets/images/Group 200.png',
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color:Colors.black,
                      ),
                    ),
                  ),

                ),


              ],
            ),
          ),


          ),
        ),

      );


  }
}
