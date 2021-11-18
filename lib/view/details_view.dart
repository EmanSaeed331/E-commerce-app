import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;
  DetailsView({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              Container(
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

                              // CustomText(
                              //   text: model.color,
                              // ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
