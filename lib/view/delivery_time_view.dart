
import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/helper/enum.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custome_sizedbox.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomSizedBox(
            height: 50,

          ),
          RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
               groupValue:delivery,
              onChanged: ( Delivery value){
                setState(() {
                  delivery = value;
                });
              },
              title:CustomText(
                text: 'Standard Delivery',
                fontSize: 24,
              ),
              subtitle:CustomText(
                overflow: TextOverflow.clip,
                text: '\n Order will be delivered between 3 - 5 business days',
                fontSize: 18,
              ),
              activeColor: PrimaryColor,
          ),
          CustomSizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue:delivery,
            onChanged: ( Delivery value){
              setState(() {
                delivery = value;
              });
            },
            title:CustomText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle:CustomText(
              overflow: TextOverflow.clip,
              text: '\n Place your order before 6pm and your items will be delivered the next day',
              fontSize: 18,
            ),
            activeColor: PrimaryColor,
          ),
          CustomSizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue:delivery,
            onChanged: ( Delivery value){
              setState(() {
                delivery = value;
              });
            },
            title:CustomText(
              text: 'Nominated Delivery',
              fontSize: 24,
            ),
            subtitle:CustomText(
              overflow: TextOverflow.clip,
              text: '\n Pick a particular date from the calendar and order will be delivered on selected date',
              fontSize: 18,
            ),
            activeColor: PrimaryColor,
          ),

        ],

      ),

    );
  }
}