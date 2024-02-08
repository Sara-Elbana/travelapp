import 'package:flutter/material.dart';
import 'package:travelapp/screens/filters_screen.dart';

class DrawerWidget extends StatelessWidget {
 // const DrawerWidget({super.key});

  Widget buildListTile(String title, IconData icon, Function() onTapLink){
    return ListTile(
            leading: Icon(
              icon,
              size: 30,
              color: Colors.blue,
              ),
              title: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Elmessiri',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                onTap: onTapLink,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const  EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
              ),
          ),
          const SizedBox(height: 20,),
          buildListTile(
            'الرحلات',
            Icons.card_travel,
            (){
              Navigator.of(context).pushReplacementNamed('/');
            },
            ),
            buildListTile(
            'الفلتره',
            Icons.filter_list,
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
            },
            ),
        ],
        ),
    );
  }
}