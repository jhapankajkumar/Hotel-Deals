import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_deals/HomeScreen/HomePageController.dart';
import './Helper/Constants.dart';




Future <void> main() async{
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'flight-firestore',
    options: FirebaseOptions(
      googleAppID: '1:761354432170:ios:a050a45a9c552190',
      gcmSenderID: '761354432170',
      databaseURL: 'https://udaan-46a0f.firebaseio.com',
    ),
  );
  
  //FireBase code
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

