import 'package:flutter/material.dart';
//import 'package:travelapp/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travelapp/data.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/categories_trips_screen.dart';
import 'package:travelapp/screens/filters_screen.dart';
import 'package:travelapp/screens/tabs_screen.dart';
import 'package:travelapp/screens/trip_details_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters ={
    'summer': false,
    'winte': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips =[];

  void _changeFilters(Map<String, bool> filterData ){
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if(_filters['summer']== true && trip.isInSummer != true){
          return false;
        }
        if(_filters['winter']== true && trip.isInWinter != true){
          return false;
        }
        if(_filters['family']== true && trip.isForFamilies != true){
          return false;
        }
        return true;
      }).toList();
    });

  }

  void _manageFavorite(String tripId){
   final existingIndex = _favoriteTrips.indexWhere((trip) => trip.id == tripId);
   if(existingIndex >= 0){
    setState(() {
      _favoriteTrips.removeAt(existingIndex);
    });
   }
   else{
    setState(() {
      _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
    });
   }

  }

  bool _isFavorite(String id){
    return _favoriteTrips.any((trip) => trip.id == id);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('ar','AE'),
  ],
      title: 'Travel App',
      theme: ThemeData(
        fontFamily: 'ElMessiri',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          ),
       // primarySwatch: Colors.blue,
        //hintColor: Colors.amber,
         //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline5:const TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          headline6:const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home:const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(cxt)=>  TabsScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute:(cxt)=>CategoryTripsScreen(_availableTrips),
        TripDetailsScreen.screenRoute: (cxt) =>TripDetailsScreen(_manageFavorite, _isFavorite),
        FiltersScreen.screenRoute:(cxt) => FiltersScreen(_filters , _changeFilters),
      },
    );
  }
}

