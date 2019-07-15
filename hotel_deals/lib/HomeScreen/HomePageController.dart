import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_deals/FlightListScreen/FlightListScreen.dart';
import 'package:hotel_deals/HomeScreen/LocationDropDownMenu.dart';
import 'package:hotel_deals/HomeScreen/SearchTextFieldContainer.dart';
import 'package:hotel_deals/Model/city.dart';
import 'package:hotel_deals/Model/location.dart';
import '../CustomView/ChoiceChipContainerView.dart';
import '../CustomView/CustomTabBar.dart';
import '../Common/CustomShapeClipper.dart';
import '../CustomView/CityCard.dart';
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
            SizedBox(
              height: 20,
            )
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
  Location selectedCity;
  String toCity;
  void _selectCity(Location city) {
    print('CITY: ' + city.name);
    setState(() {
      selectedCity = city;
    });
  }

  void _searchButtonPressed(String searchedText) {
    // setState(() {
    //   toCity = searchedText;
    // });

    //Navigating to Flight list screen
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InheritedFlightListScreen(
                  fromLocation: selectedCity.name,
                  toLocation: searchedText,
                  child: FlightListScreen(),
                )));
  }

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
                StreamBuilder<QuerySnapshot>(
                    stream:
                        Firestore.instance.collection('locations').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data != null) {
                        return _buildLocations(
                            context, snapshot.data.documents, _selectCity);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                SizedBox(
                  height: 40,
                ),

                //Text Description
                desc,

                SizedBox(
                  height: 30,
                ),
                //TextField
                SearchTextFieldContainer(_searchButtonPressed),
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

Widget _buildLocations(
    BuildContext context, List<DocumentSnapshot> snapshots, Function callBack) {
  var locations =
      snapshots.map((snapshot) => Location.fromSnapshot(snapshot)).toList();
  return LocationDropDownMenu(locations, callBack);
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
            style: TextStyle(
                fontSize: 18.0, color: Constant.appTheme.primaryColor),
          ),
        ],
      ),
    ),
    StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('cities').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data != null) {
            return _buildCities(context, snapshot.data.documents);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
  ],
);

Widget _buildCities(BuildContext context, List<DocumentSnapshot> snapshots) {
  return Container(
    height: 240,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshots.length,
      itemBuilder: (context, index) {
        return CityCard(
          city: City.fromSnapshot(snapshots[index]),
        );
      },
    ),
  );
}
