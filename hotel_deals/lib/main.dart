import 'package:flutter/material.dart';
import 'package:hotel_deals/CustomTabBar.dart';
import 'package:hotel_deals/HomeScreen/LocationDropDownMenu.dart';
import 'package:hotel_deals/HomeScreen/SearchTextFieldContainer.dart';
import 'ChoiceChipContainerView.dart';
import 'CustomShapeClipper.dart';
import 'HomeScreen/CityCards.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: appTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFF3791A),
  fontFamily: 'Oxygen',
);

List<String> locations = ['Boston (BOS)', 'New York City (JFK)'];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomTabBar(),
      body: Column(
        children: <Widget>[
          HomeScreenTopContainer(),
          homeScreenBottomContainer,
        ],
      ),
    );
  }
}

class HomeScreenTopContainer extends StatefulWidget {
  @override
  _HomeScreenTopContainerState createState() => _HomeScreenTopContainerState();
}

var desc = Text(
  'Where would\n you want to go ?',
  style: TextStyle(fontSize: 24.0, color: Colors.white),
  textAlign: TextAlign.center,
);

String dropdownValue = 'One';

class _HomeScreenTopContainerState extends State<HomeScreenTopContainer> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFF47D15), Color(0xFFEF772C)])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                //DropDownMenu
                LocationDropDownMenu(locations),
                SizedBox(
                  height: 40,
                ),

                //Text Description
                desc,

                SizedBox(
                  height: 30,
                ),
                //TextField
                SearchTextFieldContainer(),
                SizedBox(
                  height: 20,
                ),
                //Segmented Controll VIew
                ChoiceChipContainerView()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

var homeScreenBottomContainer = Column(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Text(
            'Currently Watched Items',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
          Spacer(),
          Text(
            'VIEW ALL (4)',
            style: TextStyle(fontSize: 18.0, color: appTheme.primaryColor),
          ),
        ],
      ),
    ),
    Container(
      // color: Colors.blueAccent,
      height: 240,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    )
  ],
);

List<CityCard> cityCards = [
  CityCard('assets/images/lasvegas.jpg', 'Las Vegas', 'Feb 219', '45', '2250.00',
      '3423.00'),
  CityCard(
      'assets/images/athens.jpeg', 'Athens', 'Mar 2016', '10', '4563.00', '3423.00'),
  CityCard(
      'assets/images/sydeny.jpg', 'Sydeny', 'Apr 2009', '19', '4563.00', '3423.00'),
  CityCard(
      'assets/images/pic1.jpeg', 'Pic1', 'May 2013', '22', '4563.00', '3423.00'),
];


