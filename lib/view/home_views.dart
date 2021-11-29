import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/control_view_model.dart';
import 'package:ecommerce/core/view_model/home_view_model.dart';
import 'package:ecommerce/view/details_view.dart';
import 'package:ecommerce/view/devices_category_product.dart';
import 'package:ecommerce/view/gadgets_category_product.dart';
import 'package:ecommerce/view/gaming_category_product.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:ecommerce/view/men_products_view.dart';
import 'package:ecommerce/view/women_category_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                    left: 20,
                    right: 20,
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        _searchTextFormField(),
                        CustomSizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: 'Categories',
                        ),
                        CustomSizedBox(
                          height: 20,
                        ),
                        _listViewCategory(),
                        CustomSizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Best Selling',
                              fontSize: 18,
                            ),
                            CustomText(
                              text: 'See all',
                              fontSize: 18,
                            ),
                          ],
                        ),
                        CustomSizedBox(
                          height: 10,
                        ),
                        _listViewProduct(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade100),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryMddel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          if (controller.categoryMddel[index].name == 'Men')
                          {
                            Get.to(MenCategoryProducts());

                          }
                          else if(controller.categoryMddel[index].name == 'Women')
                          {
                            Get.to(WomenCategoryProducts());
                          }
                          else if(controller.categoryMddel[index].name == 'Gadgets')
                          {
                            Get.to(GadgetsCategoryProducts());
                          }  else if(controller.categoryMddel[index].name == 'Gaming')
                          {
                            Get.to(GamingCategoryProducts());
                          }  else if(controller.categoryMddel[index].name == 'Devices')
                          {
                            Get.to(DevicesCategoryProducts());
                          }
                        },
                          child: Image.network(
                              controller.categoryMddel[index].image)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomText(text: controller.categoryMddel[index].name),
              ],
            );
          },
          separatorBuilder: (context, int index) => CustomSizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Expanded(
        child: Container(
          height: 350,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(DetailsView(
                          model: controller.productModel[index],
                        ));
                      },
                      child: Container(
                        // width: 100,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(height: 3),
                    CustomText(
                      text: '''controller.productModel[index].description''',
                      alignment: Alignment.bottomLeft,
                      maxLine: 2,
                      width: 40,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3),
                    CustomText(
                      color: PrimaryColor,
                      text: controller.productModel[index].price,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, int index) => CustomSizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }
}
