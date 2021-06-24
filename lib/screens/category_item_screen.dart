import 'package:flutter/material.dart';
import 'package:meal_app/1.1%20dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/mealItem.dart';

class CategoryItemScreen extends StatefulWidget {
  static final String CategoryItemScreenRoute='x1';
  int index=0;
  @override
  _CategoryItemScreenState createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
   //List<Meal> mealsList=DUMMY_MEALS;
   String id='';
   String title='';
    late List<Meal> meals;

   @override
  void didChangeDependencies() {

     final args=ModalRoute.of(context)!.settings.arguments as Map<String,Object> ;
      title=args['title'].toString();
     String id=args['id'].toString();
      meals=DUMMY_MEALS.where((element)  {
       return element.categories.contains(id);
     }).toList();

     super.didChangeDependencies();
  }

  void removeMeal(String value) {
    setState(() {
      id=value;
      meals.removeWhere((element) => element.id==value);
      print('removeeeeeeeeeeeeee');
    });
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: ListView.builder(itemBuilder: (ctx,index){
      return MealItem(meals[index],removeMeal);

    },
    itemCount: meals.length,),
  );
  }

}


