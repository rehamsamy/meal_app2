import 'package:flutter/material.dart';
import 'package:meal_app/screens/main_drawer.dart';

import 'categoriesScreen.dart';
import 'favorite_screen.dart';

class TabsScreen  extends StatefulWidget {
  
  @override
  _State createState() => _State();
}

class _State extends State<TabsScreen> {
   var index=0;

  List<Map<String,Object>> _pages=[
    {'title':'Categories','page':CategoriesScreen()},
    {'title':'Favorites','page':FavoriteScreen()}
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[index]['title'].toString()),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
         onTap: _selectIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.category_rounded),
            title: Text('Categories')
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star),
              title: Text('Favorite')),

        ],
      ),
      body: _pages[index]['page']  as Widget,
      drawer:MainDrawer()
    );
  }

  void _selectIndex(int value) {
    setState(() {
      index=value;
    });

  }
}
