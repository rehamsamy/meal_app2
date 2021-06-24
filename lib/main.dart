import 'package:flutter/material.dart';
import 'package:meal_app/screens/Screen.dart';
import 'package:meal_app/screens/categoriesScreen.dart';
import 'package:meal_app/screens/category_item_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 245, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
           color: Color.fromRGBO(20, 50, 20, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 50, 20, 1)
          ),
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
                fontSize: 25
          )
        )

      ),
      //home:'',
      initialRoute: '/',
      //MyHomePage(title: 'Flutter Demo Home Page'),
      routes:{
        '/x1':(context)=>new Screen(),
        CategoryItemScreen.CategoryItemScreenRoute:(context)=>new CategoryItemScreen()
        ,MealDetailScreen.mealDetailScreenRoute:(context)=>new MealDetailScreen(),
        '/':(context)=>TabsScreen(),
        FiltersScreen.FilterRoute:(context)=>FiltersScreen()
      } ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,  required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body:new CategoriesScreen(),

    );
  }
}
