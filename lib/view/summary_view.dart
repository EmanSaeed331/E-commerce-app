import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
            CustomSizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(

                height: 350,
                 child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    child: Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 180,
                            child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.fitWidth,

                            ),
                          ),
                          CustomSizedBox(
                            height: 5,
                          ),
                          RichText(
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black
                              ),
                               text: controller.cartProductModel[index].name,
                            ),
                          ),
                          CustomSizedBox(
                            height: 10,
                          ),
                          CustomText(
                            alignment: Alignment.bottomLeft,
                            color: PrimaryColor,
                            text:
                            '\$ ${controller.cartProductModel[index].price.toString()}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: controller.cartProductModel.length,
                   separatorBuilder:(context , index){
                    return CustomSizedBox(width: 15,);
                   } ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
