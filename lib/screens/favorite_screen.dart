import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
 // const FavoriteScreen({super.key});

 final List<Trip> favoriteTrips;

  FavoriteScreen(this.favoriteTrips);


  @override
  Widget build(BuildContext context) {
    if(favoriteTrips.isEmpty){
      return const Center(
      child: Text('ليس لديك أي رحلة في قائمة المفضلة'),
    );
    }
    else{
      return ListView.builder(
        itemBuilder: (cxt, index){
          return TripItem(
            id:favoriteTrips[index].id,
            title: favoriteTrips[index].title,
             image: favoriteTrips[index].image,
              duration: favoriteTrips[index].duration, 
              tripType: favoriteTrips[index].tripType,
               season: favoriteTrips[index].season,
               );
        },
        itemCount: favoriteTrips.length,
        );
    }
    
  }
}