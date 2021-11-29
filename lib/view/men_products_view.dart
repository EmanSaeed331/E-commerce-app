import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/category_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class MenCategoryProducts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
        ),
        child: Container(
          child:Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 150,
              //     right: 150,
              //   ),
              //   child: CustomText(
              //     text: 'Man',
              //     fontSize: 20,
              //   ),
              // ),
              MenProductList(),

            ],
          ),
           // MenProductList(),
        ),
      ),
    );
  }

  // Widget _listViewProduct() {
  //   return GetBuilder<HomeViewModel>(
  //     builder: (controller) => Expanded(
  //       child: Container(
  //         height: 350,
  //         child: ListView.separated(
  //           itemCount: controller.productModel.length,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) {
  //             return Container(
  //               width: MediaQuery.of(context).size.width * .4,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       Get.to(DetailsView(
  //                         model: controller.productModel[index],
  //                       ));
  //                     },
  //                     child: Container(
  //                       // width: 100,
  //                       width: MediaQuery.of(context).size.width * .4,
  //                       child: Image.network(
  //                         controller.productModel[index].image,
  //                         fit: BoxFit.fill,
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 3),
  //                   CustomText(
  //                     text: controller.productModel[index].name,
  //                     alignment: Alignment.bottomLeft,
  //                   ),
  //                   SizedBox(height: 3),
  //                   CustomText(
  //                     text: '''controller.productModel[index].description''',
  //                     alignment: Alignment.bottomLeft,
  //                     maxLine: 2,
  //                     width: 40,
  //                     color: Colors.grey,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                   SizedBox(height: 3),
  //                   CustomText(
  //                     color: PrimaryColor,
  //                     text: controller.productModel[index].price,
  //                     alignment: Alignment.bottomLeft,
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //           separatorBuilder: (context, int index) => CustomSizedBox(
  //             width: 20,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }


  Widget MenProductList() {
    return GetBuilder<CategoryViewModel>(
      builder:(controller) => Container (
        width:  double.infinity,
        height: 600,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder (
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.3/ 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),

              itemCount: controller.categoryProductModel.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                     width: MediaQuery.of(context).size.width * .4,

                      alignment: Alignment.center,
                      child:
                        Image.asset('assets/images/Image.png' ,
                        fit: BoxFit.fill,


                        //fit: BoxFit.fill,

                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        //  borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    CustomText(

                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
