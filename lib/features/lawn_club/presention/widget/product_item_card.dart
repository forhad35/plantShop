import 'package:flutter/material.dart';
import 'package:plant_shop/features/lawn_club/data/model/food_data_model.dart';
Widget sh(double val) {
  return SizedBox(height: val);
}

Widget sw(double val) {
  return SizedBox(width: val);
}

double dh(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double dw(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
// ignore: must_be_immutable
class ProductItemCard extends StatelessWidget {
   ProductItemCard({super.key, required this.foodItem});
   FoodItem foodItem ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: Colors.black12
        ))
      ),
      child:SizedBox(
        // width: MediaQuery.sizeOf(context).width * 0.96,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0,left: 0,right: 0,bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // vag non-veg , and rating section , menu icon
                  Row(
                    children: [
                      SizedBox(
                        width: dw(context)* 0.19,
                        child: Row(    //    vag non-veg
                          children: [
                            icon(Icons.square_rounded, foodItem.veg == "Veg"?Colors.green:Colors.red ),
                            sw(5),
                            Text(foodItem.veg,style: TextStyle(color: Colors.grey,fontSize: 12),)
                          ],
                        ),
                      ),
                      Row( // Rating section
                        children: [
                          icon(Icons.star ,Colors.green),
                          Text("${foodItem.rating}",style: TextStyle(color: Colors.green,fontSize: 12),),
                          Text("(${foodItem.ratingCount})",style: TextStyle(color: Colors.grey,fontSize: 12),)
                        ],
                      ),
                      sw(dw(context)*0.085),
                      // menu  icon
                      IconButton(onPressed: (){}, icon:  icon(Icons.more_vert ,Colors.black),
                      )
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(0, -10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodItem.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        SizedBox(    // Description
                            width: dw(context) /2.15,
                            child: Text(foodItem.description,style: TextStyle(fontSize: 12,color: Colors.grey),)),
                        sh(10),
                        Row( // price
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.translate(offset: Offset(0, -3.5),
                                child: const Text("\$",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                            sw(3),
                            Text("${foodItem.price}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
              SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  foodItem.imageUrl,
                  width: 140,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 140,
                      height: 100,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: Text(
                        'Image not found',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    );
                  },
                ),
              )

            ),
          ],
        ),
      ) ,
    );
  }
  icon(icon,color){
    return Icon(icon , size: 16,color:color,);
  }

}
