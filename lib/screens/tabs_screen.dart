//import 'dart:ffi';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/categories_screen.dart';
import 'package:travelapp/screens/favorite_screen.dart';
import 'package:travelapp/widgets/drawerr.dart';

class TabsScreen extends StatefulWidget {
 // const TabsScreen({super.key});

 final List<Trip> favoriteTrips;
 
 TabsScreen(this.favoriteTrips);

 


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  void _selectScreen(int index){
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;
      
  late List<Map<String, Object>> _screen;

  @override
  void initState() {
    _screen =[
    {
      'Screen': CategoriesScreen(),
       'Title': 'تصنيفات الرحلات',
    },
    {
      'Screen':  FavoriteScreen(widget.favoriteTrips),
      'Title': 'الرحلات المفضله',
    },
  ];
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen[_selectScreenIndex]['Title'] as String ) ,
      ),
      drawer: DrawerWidget(),
      body: _screen[_selectScreenIndex]['Screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen ,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: _selectScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'التصنيفات',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'المفضله',
              ),
          ],
          ),
    );
  }
}