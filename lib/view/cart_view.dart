import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init:CartViewModel(),
              builder : (controller) => Container(
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
                                  text: '\$ ${controller.cartProductModel[index].price.toString()}',

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
                                    Icon(Icons.add,
                                      color: Colors.black,
                                    ),
                                    CustomSizedBox(
                                      width: 20,
                                    ),
                                    CustomText(
                                      alignment: Alignment.center,
                                      text: '1' ,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    CustomSizedBox(
                                      width: 20,
                                    ),

                                    Container(
                                      padding: EdgeInsets.only(
                                        bottom: 20
                                      ),
                                      child: Icon(Icons.minimize,
                                        color: Colors.black,
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
                    CustomText(
                      text: '\$ 2000',
                      color:PrimaryColor,
                      fontSize: 18,
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
    );
  }
}
