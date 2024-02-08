import 'package:flutter/material.dart';
import 'package:travelapp/data.dart';
//import '../data.dart';
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
 // const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:const EdgeInsets.all(10),
        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
           ),
        children: Category_data.map((categorydata) => CategoryItem(
          categorydata.id,
          categorydata.title, 
          categorydata.image,
          )
          ).toList(),
      );
  }
}