import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/Screen.dart';
import 'package:meal_app/widget/categoryItem.dart';

import '../1.1 dummy_data.dart';
import 'category_item_screen.dart';

class   CategoriesScreen extends StatelessWidget {
  late Category xx;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Meal'),
        ),
        body: GridView(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 120,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              maxCrossAxisExtent: 200,

            ),
            children: DUMMY_CATEGORIES.map((e) =>
                CategoryItem(e)
            ).toList()
        ),
      );
  }


}

