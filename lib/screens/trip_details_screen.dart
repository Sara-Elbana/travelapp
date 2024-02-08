import 'package:flutter/material.dart';
import 'package:travelapp/data.dart';

class TripDetailsScreen extends StatelessWidget {
  //const TripDetailsScreen({super.key});
  static const screenRoute = '/trip-details';

  final Function manageFavorite;
  final Function isFavorite;

  TripDetailsScreen(this.manageFavorite, this.isFavorite);

  Widget buildSectionTitle (BuildContext context, String titleText){
    return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
            alignment: Alignment.topRight,
            child: Text(
              titleText,
              style: Theme.of(context).textTheme.headline5,
              ),
          );
  }

  Widget buildListView (Widget child){
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 200,
            padding: const EdgeInsets.all(10),
            child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId= ModalRoute.of(context)?.settings.arguments as String;
    final selectTrip= Trips_data.firstWhere((trip)=>trip.id== tripId);
    return  Scaffold(
      appBar: AppBar(
        title: Text('${selectTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectTrip.image,
                fit: BoxFit.cover,
                ),
            ),
            const SizedBox(height: 10,),
            buildSectionTitle(context,'الأنشطة'),
            buildListView (
               ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (cxt,index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10,),
                    child: Text(selectTrip.activities[index]),
                  ),
                ),
                
                ),
            ),
            const SizedBox(height: 10,),
            buildSectionTitle(context,'البرنامج اليومي'),
            buildListView(
              ListView.builder(
                itemCount: selectTrip.program.length,
                itemBuilder: (cxt,index)=>Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index+1}'),
                        ),
                        title: Text(selectTrip.program[index]),
                    ),
                   const Divider(),
                  ],
                ),
                ),
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed:()=> manageFavorite(tripId),
      child: Icon(
        isFavorite(tripId)? Icons.star : Icons.star_border,
      ),
      ),
            
    );
  }
}



