import 'package:flutter/material.dart';
import 'package:hotel_deals/HomeScreen/LocationDropDownMenu.dart';
import 'package:hotel_deals/HomeScreen/SearchTextFieldContainer.dart';
import '../CustomView/ChoiceChipContainerView.dart';
import '../CustomView/CustomTabBar.dart';
import '../Common/CustomShapeClipper.dart';
import '../CustomView/CityCards.dart';
import '../Helper/Constants.dart';


List<String> locations = ['Boston (BOS)', 'New York City (JFK)'];

class MyHomePageController extends StatefulWidget {
  MyHomePageController({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomTabBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
          children: <Widget>[
            HomeScreenTopContainer(),
            homeScreenBottomContainer,
            homeScreenBottomContainer,
            SizedBox(height: 20,)
          ],
        ),
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
            style: Constant.dropDownItemStyle,
          ),
          Spacer(),
          Text(
            'VIEW ALL (4)',
            style: TextStyle(fontSize: 18.0, color: Constant.appTheme.primaryColor),
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
