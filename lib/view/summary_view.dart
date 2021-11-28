import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller)=> Column(
          children: [
            CustomSizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              color: Colors.red,

              child: ListView.builder(itemBuilder: (context,index)=>
                  Container(
              ),
                itemCount:controller.cartProductModel.length , ),
            ),

          ],
        ),
      ),
    );
  }
}