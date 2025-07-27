import 'package:flutter/material.dart';
import 'package:plant_shop/features/lawn_club/data/food_data.dart';
import 'package:plant_shop/features/lawn_club/data/model/food_data_model.dart';
import 'package:plant_shop/features/lawn_club/data/model/product_item_card.dart';


class AllProduct extends StatefulWidget {
 const  AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
 final searchController = TextEditingController();
 List<FoodItem> foodItems = foodItemsRowData;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 350,
          child: ListView.separated(
            itemCount: foodItems.length,
              itemBuilder: (context,index){
            FoodItem foodItem = foodItems[index];
            return ProductItemCard(foodItem: foodItem);
          }, separatorBuilder: (_,_)=>SizedBox(height: 5,)),
        )
      ],
    );
  }
}
