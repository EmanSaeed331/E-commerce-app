import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  GetBuilder<CartViewModel>(
        init:Get.find(),
    builder : (controller) => Scaffold(
      body: controller.cartProductModel.length ==0 ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/cart_empty.svg',
            width: 200 ,
            height: 200,
          ),
          CustomSizedBox(
            height: 20,
          ),
          CustomText(
            alignment: Alignment.topCenter,
            text: 'Empty Cart',
            fontSize: 32,
          ),
        ],
      )
          : Column(
        children: [
          Expanded(
            child:Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            child: Image.network(
                                controller.cartProductModel[index].image,
                                fit: BoxFit.fill),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.cartProductModel[index].name,
                                  fontSize: 24,
                                ),
                                CustomSizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  color: PrimaryColor,
                                  text: '\$ ${controller.cartProductModel[index].price}',

                                ),
                                CustomSizedBox(
                                  height: 20,
                                ),
                              Container(
                                width: 140,
                                color: Colors.grey.shade200,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.center ,
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        controller.increaseQuatity(index);
                                      },
                                      child: Icon(Icons.add,
                                        color: Colors.black,


                                      ),
                                    ),
                                    CustomSizedBox(
                                      width: 20,
                                    ),
                                    CustomText(
                                      alignment: Alignment.center,
                                      text: controller.cartProductModel[index].quantity.toString(),
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    CustomSizedBox(
                                      width: 20,
                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        controller.decreaseQuatity(index);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          bottom: 20
                                        ),

                                        child: Icon(Icons.minimize,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.cartProductModel.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return CustomSizedBox(
                      height: 15,
                    );
                  },
                ),
              ),

          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'Total',
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    CustomSizedBox(
                      height: 15,
                    ),
                    GetBuilder<CartViewModel>(
                      init:Get.find(),
                      builder:(controller) => CustomText(
                        text: '\$ ${controller.totalPrice}',
                        color:PrimaryColor,
                        fontSize: 18,
                      ),
                    ),

                  ],
                ),
                Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  width: 150,
                  child: CustomButton(
                   onPress: (){ },
                    text: 'CHECKOUT',

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
