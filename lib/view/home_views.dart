import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/view_model/control_view_model.dart';
import 'package:ecommerce/core/view_model/home_view_model.dart';
import 'package:ecommerce/view/cart_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeView extends StatelessWidget {
final List<String> names = <String>[
  'men',
  's',
  's',
  's',
  's',
];
  @override
  Widget build(BuildContext context) {
    return GetBuilder <HomeViewModel>(
      builder : (controller)=> Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top:100,
              left:20,
              right: 20,
            ),
            child: Column(
              children: [
                _searchTextFormField(),
                CustomSizedBox(
                   height:30,
                ),
                CustomText(
                  text:'Categories',

                ),
                CustomSizedBox(
                  height:30,
                ),
                _listViewCategory(),
                CustomSizedBox
                  (
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Best Selling',
                    fontSize: 18,
                  ),

                  CustomText(text: 'See all',
                    fontSize: 18,
                  ),

                ],
                ),
                CustomSizedBox(
                  height: 20,
                ),
                _listViewProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
 Widget _searchTextFormField(){
    return  Container(
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
          color:Colors.grey.shade200
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,
              color:Colors.black),

        ),
      ),

    );
  }
  Widget _listViewCategory(){
    return  Container(
      height: 100,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context ,index){
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Icon_Mens Shoe.png'),
                  ),

                ),
              ),
              SizedBox(height: 20),
              CustomText(text: names[index]),
            ],
          );
        }, separatorBuilder: ( context, int index) => CustomSizedBox(
        width: 20,
      ),
      ),
    );

  }

 Widget _listViewProduct() {
    return  Expanded(
      child: Container(
        height: 350,
        child: ListView.separated(
          itemCount: names.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context ,index){
            return SingleChildScrollView(
              child: Column(
                children: [
                     Container(
                       width: MediaQuery.of(context).size.width * .4,
                         child:
                         Image.asset('assets/images/Image.png' ,
                           fit: BoxFit.fill,
                         ),
                     ),
                  SizedBox(height: 3),

                  CustomText(
                       text: 'BeoPlay Speaker',
                       alignment: Alignment.bottomLeft,

                     ),
                  SizedBox(height: 3),

                  CustomText(
                       text: 'Bang and Qlufsen',
                       alignment: Alignment.bottomLeft,
                       color: Colors.grey,

                     ),
                  SizedBox(height: 3),

                  CustomText(
                    color: PrimaryColor,
                       text: '\$755',
                       alignment: Alignment.bottomLeft,

                     ),

                ],
              ),
            );
          }, separatorBuilder: ( context, int index) => CustomSizedBox(
          width: 20,
        ),
        ),
      ),
    );

  }

}
