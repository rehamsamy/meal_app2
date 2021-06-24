import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

import '../1.1 dummy_data.dart';

class MealItem extends StatelessWidget {

 final Meal meals;
  String complex='';
  Function f;
 List<Meal> mealsList=DUMMY_MEALS;
  MealItem( this.meals,this.f);




 String get getAffroidate {
   if (meals.affordability == Affordability.Affordable) {
     return 'Affordable';
   } else if (meals.affordability == Affordability.Luxurious) {
     return 'Luxurious';
   } else if (meals.affordability == Affordability.Pricey) {
     return 'Pricey';
   }else{
     return '';
   }
 }

  String get getComplex{
    switch(meals.complexity){
      case Complexity.Hard : return 'hard';
      case Complexity.Challenging : return 'challenge';
      case Complexity.Simple : return 'simple';
      break;
    }
    }





  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>getDetail(context),
      child: Card(
        elevation: 30,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Stack(
              children: [
              ClipRRect(child: Image.network(meals.imageUrl,fit: BoxFit.cover,),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),topRight: Radius.circular(20)
      ),),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    width: 320,
                      child: Text(meals.title,style: TextStyle(fontSize: 20,color: Colors.white),
                        softWrap: true,
                        overflow:TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
             Row(children: [
                 Icon(Icons.alarm),
                 SizedBox(width: 6,),
                 Text('${meals.duration.toString()} am')
               ],),

                    Row(children: [
                      Icon(Icons.shopping_bag),
                      SizedBox(width: 6,),
                      Text('${getComplex}')
                    ],),
                    Row(children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text('${getAffroidate}')
                    ],)
                  ],
                ),
         ),

          ],
        ),
      ),
    );
  }




  void getDetail(BuildContext context){
   Navigator.of(context).pushNamed(MealDetailScreen.mealDetailScreenRoute,
       arguments:
       {'meal':meals}
   ).then((value) {
     if (value !=null){
      f(value.toString());
     }
   }
   );
  }


}

