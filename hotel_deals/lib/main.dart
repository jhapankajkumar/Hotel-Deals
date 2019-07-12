
import 'package:flutter/material.dart';
import 'package:hotel_deals/HomeScreen/HomePageController.dart';
import './Helper/Constants.dart';




Future <void> main() async{
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: Constant.appTheme,
      home: MyHomePageController(title: 'Flutter Demo Home Page'),
    );
  }
}

