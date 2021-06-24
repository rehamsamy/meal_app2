import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../1.1 dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static String  mealDetailScreenRoute='/x2';


  Widget getMealDetailLabel(String title,BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,style: Theme.of(context).textTheme.title,),
    );
  }


  Widget getMealDetailsList(BuildContext context,Widget widget){
    return  Container(
      margin: EdgeInsets.all(10),
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)
      ),
      height: 150,
      width: 300,
      padding: EdgeInsets.all(20),
      child: widget,

    );
  }

  @override
  Widget build(BuildContext context) {

    final args=ModalRoute.of(context)!.settings.arguments as Map<String,Meal>;
    Meal src=DUMMY_MEALS.firstWhere((element) =>
      args['meal']!.id==element.id
    );


    List<String> ingredients=args['meal']!.ingredients;


    List<String> ingredient=src.ingredients;


    return Scaffold(
      appBar: AppBar(
        title:Text(args['meal']!.title.toString()) ,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
                height:300 ,

                child: Image.network(src.imageUrl,
                  fit: BoxFit.cover,
                ),),
            getMealDetailLabel('Ingedients',context),
            getMealDetailsList(context,
             ListView.builder(
                itemBuilder:(_,i){
                  return Card(child: Text(ingredient[i]),
                    color: Theme.of(context).accentColor,
                  );
                },
                itemCount: ingredients.length),),
           getMealDetailLabel('Steps',context),
           getMealDetailsList(context,
            ListView.builder(
              itemBuilder: (ctx,i)=>Column(
                children: [
                  ListTile(
                    title: Text(src.steps[i]),
                    leading: CircleAvatar(
                      child: Text('# ${i+1}'),
                    )
                  ),
                  Divider(
                  thickness: 5,
                  color: Colors.green,
                  )
                ],
              )
      ,
        itemCount: src.ingredients.length,
      ),)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(src.id);
        },
      ),
    );
  }
}
