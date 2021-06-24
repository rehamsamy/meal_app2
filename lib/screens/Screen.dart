import 'package:flutter/material.dart';

import '../1.1 dummy_data.dart';

class Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var x=ModalRoute.of(context)!.settings.arguments as Map<String,Object>;
    String id= x['id'].toString();
    return ListView(

      children: DUMMY_MEALS.map((e) =>
     // e.id==id? Image.network(e.imageUrl):null;

          Image.network(e.imageUrl)
      ).toList(),
    );
  }
}
