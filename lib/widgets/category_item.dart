//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:travelapp/screens/categories_trips_screen.dart';
//import 'package:travelapp/screens/categories_trips_screen.dart';
//import 'package:flutter/widgets.dart';

class CategoryItem extends StatelessWidget {
 // const CategoryItem({super.key});
  final String id;
  final String title;
  final String image;

   CategoryItem(this.id, this.title, this.image);

  void selectCatogory(BuildContext cxt){
    Navigator.of(cxt).pushNamed(
      CategoryTripsScreen.screenRoute,
      arguments: {
        'id': id,
        'title': title,

      }
      );
      
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectCatogory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image,
              height: 250,
              fit: BoxFit.cover,
              ),
          ),
            Container(
              padding:const EdgeInsets.all(10),
              alignment: Alignment.center,
              child:  Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
        ],
      ),
    );
  }
}