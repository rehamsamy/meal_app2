import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/category_item_screen.dart';

class CategoryItem extends StatelessWidget{
  Category category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
   return InkWell(
     splashColor: Colors.green,
     borderRadius: BorderRadius.circular(20),
     onTap: ()=>x(context,'nnn'),
     //color: category.color,
     child: Container(child: Center(
       child: Text(category.title,
       style: Theme.of(context).textTheme.title),
     ),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20),
           color: category.color,
         gradient:LinearGradient(
         colors:[
           category.color.withOpacity(0.2),
         category.color
         ],
       begin: Alignment.topLeft,
       end: Alignment.bottomRight

     )
     ),

     )
   );
  }




  void x(BuildContext context,String y){
    Navigator.of(context).pushNamed(CategoryItemScreen.CategoryItemScreenRoute,
        arguments:
        {'category':category,
        'id':category.id,
        'title':category.title,
        }
    );
  }



}