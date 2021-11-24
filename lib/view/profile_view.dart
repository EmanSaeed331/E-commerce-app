import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder <ProfileViewModel>(
      init : ProfileViewModel(),
    builder:(controller) =>Scaffold(
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
                              ? const AssetImage('/assets/images/avatar.png')
                              :controller.userModel.pic == 'default'
                                ? const AssetImage('/assets/images/avatar.png')
                                :NetworkImage(
                                    controller.userModel.pic,
                                     ),
                          fit: BoxFit.fill
                        ),
                      ),

                    )
                    ],
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
