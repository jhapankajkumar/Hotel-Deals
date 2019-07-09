import 'package:flutter/material.dart';
import 'package:hotel_deals/HomeScreen/LocationDropDownMenu.dart';
import 'package:hotel_deals/HomeScreen/SearchTextFieldContainer.dart';
import 'ChoiceChipContainerView.dart';
import 'CustomShapeClipper.dart';

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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          HomeScreenTopContainer(),
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
                  height: 30,
                ),
                LocationDropDownMenu(locations),
                SizedBox(
                  height: 40,
                ),
                desc,
                SizedBox(
                  height: 30,
                ),
                SearchTextFieldContainer(),
                SizedBox(
                  height: 20,
                ),
                ChoiceChipContainerView()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
