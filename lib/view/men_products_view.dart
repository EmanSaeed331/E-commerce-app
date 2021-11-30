import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/category_view_model.dart';
import 'package:ecommerce/core/view_model/home_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class MenCategoryProducts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
        ),
        child: Container(
          child:Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(
                   left: 150,
                   right: 150,
                 ),
                 child: CustomText(
                   text: 'Men',
                   fontSize: 20,
                 ),
               ),
            //  MenProductList(),
              _listViewProduct(),

            ],
          ),
           // MenProductList(),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 580,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200
                ),
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.to(DetailsView(
                    //       model: controller.productModel[index],
                    //     ));
                    //   },
                       Container(
                        // width: 100,

                       // width: MediaQuery.of(context).size.width * .8,
                         width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: controller.productModel[index].name,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(

                        text: controller.productModel[index].description,
                        alignment: Alignment.bottomLeft,
                        //width: 40,
                        color: Colors.grey,
                        overflow: TextOverflow.clip,
                        maxLine: 2,

                      ),
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        color: PrimaryColor,
                        text: controller.productModel[index].price,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, int index) => CustomSizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }


  Widget MenProductList() {
    return GetBuilder<CategoryViewModel> (
      builder:(controller) =>  Container (
        width:  double.infinity,
        height: 600,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder (
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.1/ 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),

              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                     width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child:
                        Image.network(controller.categoryProductModel[index].image ,
                          //fit: BoxFit.fill,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),


                      ),
                    ),
                    CustomSizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: controller.categoryProductModel[index].name,

                    ),
                    CustomText(
                      text: controller.categoryProductModel[index].description,

                    ),
                    CustomText(
                      text: '\$ ${controller.categoryProductModel[index].price}',
                      color: PrimaryColor,

                    ),

                  ],
                );
              }),
        ),
      ) ,
    );
  }
}
