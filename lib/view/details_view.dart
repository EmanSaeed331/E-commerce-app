import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/model/carrt_product_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;
  DetailsView({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
              CustomSizedBox(height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CustomText(
                          text: model.name,
                          fontSize: 26,
                        ),
                        CustomSizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Size',
                                  ),

                                  CustomText(
                                    text: model.sized,
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Color',
                                  ),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(color:Colors.grey),
                                      borderRadius: BorderRadius.circular(20),
                                      color: model.color,
                                    ),
                                  ),
                                  // CustomText(
                                  //   text: model.color,
                                  // ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        CustomSizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'Details',
                          fontSize: 18,
                        ),
                        CustomSizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: model.description,
                          fontSize: 18,
                          height: 2,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 30,

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          fontSize: 18,
                          text: 'PRICE',
                          color: Colors.grey,
                        ),
                        CustomText(
                          text: model.price ,
                          color: PrimaryColor,
                          fontSize: 18,
                        ),
                      ],
                    ),
                    GetBuilder <CartViewModel>(
                      init:CartViewModel(),
                      builder:(controller) =>
                       Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: 130,
                            height: 50,
                            child: CustomButton(
                              text: 'Add ',
                              onPress: (){
                                controller.addProduct(
                                    CartProductModel(
                                  name:model.name,
                                  image: model.image,
                                  price: model.price,
                                  quantity: 1
                                    )
                                );

                              },

                            ),
                          ),
                        ),
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
