import 'package:flutter/material.dart';
//import 'package:travelapp/data.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  //const CategoryTripsScreen({super.key});
  static const screenRoute ='/category-trips';

  final List<Trip> availableTrips;
  
  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {

  late String categoryTitle;
  late List<Trip> displayTrips;

  
  
  @override
  void didChangeDependencies() {
    final routeArgument= ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId=routeArgument['id'];
     categoryTitle =routeArgument['title']!;
    displayTrips=widget.availableTrips.where((trip){
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }


  void _removeTrip(String tripId){
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });

  }
 // final String categoryId;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, index){
          return TripItem(
            id:displayTrips[index].id,
            title: displayTrips[index].title,
             image: displayTrips[index].image,
              duration: displayTrips[index].duration, 
              tripType: displayTrips[index].tripType,
               season: displayTrips[index].season,
               //removeItem: _removeTrip,
               );
        },
        itemCount: displayTrips.length,
        ),
    );
  }
}