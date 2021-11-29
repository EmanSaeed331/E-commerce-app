import 'package:ecommerce/core/view_model/checkout_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init:Get.find(),
      builder:(controller)=> Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                        CustomSizedBox(
                          height: 20,
                        ),
                      CustomText(
                        text:' \n Billing address is the same as delivery  address',
                        fontSize: 18,
                        overflow: TextOverflow.clip,
                        alignment: Alignment.center,
                      ),
                      CustomSizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        onSaved: (value){
                           controller.Street1 = value;
                        },
                        validator: (String value){
                          if (value.isEmpty)
                            {
                              return 'You must write your street ';
                            }
                        },
                        text: 'Street 1',
                        hintText:'21, Alex Davidson Avenue',
                      ),
                      CustomSizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        onSaved: (value){
                          controller.Street2 = value;
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return 'You must write your street ';
                          }
                        },
                        text: 'Street 2',
                        hintText:'Opposite Omegatron, Vicent Quarters',
                      ),
                      CustomSizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        text: 'City',
                        onSaved: (value){
                          controller.city = value;
                        },
                        hintText:'Victoria Island',
                        validator: (String value){
                          if (value.isEmpty){
                            return 'You must write your City ';
                          }

                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),

        ),
    );
  }
}