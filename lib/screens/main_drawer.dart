import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'filters_screen.dart';

class MainDrawer  extends StatelessWidget {


  var x=TextStyle(
    fontSize: 25,
    fontFamily: 'RobotoCondensed',
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  Widget getListTile(BuildContext context,IconData icon,String text,int value){
    return ListTile(
      title: Text(text,style: x,),
      leading: Icon(icon,size: 30,),
      onTap:() =>openFilters(context,value),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,
      child: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!',style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900
            ),),
          ),
          SizedBox(height: 20,),
         getListTile(context, Icons.restaurant, 'Meals',1),
          SizedBox(height: 20,),
         getListTile(context, Icons.settings, 'Filters',2)
        ],
      ),
    );
  }

  void openFilters(BuildContext context,value){
    value==1?
         Navigator.of(context).pushNamed('/'):
    Navigator.of(context).pushNamed(FiltersScreen.FilterRoute);
  }



}


