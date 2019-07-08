import 'package:flutter/material.dart';

var dropDownStyle = TextStyle(color: Colors.white, fontSize: 16.0);
var dropDownItemStyle = TextStyle(color: Colors.black, fontSize: 18.0);
class LocationDropDownMenu extends StatefulWidget {
  final List<String> cities;
  LocationDropDownMenu(this.cities);

  @override
  _LocationDropDownMenuState createState() => _LocationDropDownMenuState();
}

class _LocationDropDownMenuState extends State<LocationDropDownMenu> {
  var selectedIndex = 0;
  var selectedCity = '';

  @override
  void initState() {
    selectedIndex = 0;
    selectedCity = widget.cities[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          //Map Icon
          Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          SizedBox(
            width: 16,
          ),
          PopupMenuButton(
            onSelected: (city) {
              setState(() {
                selectedCity = city;
              });
            },
            child: Row(
              children: <Widget>[
                Text(
                  selectedCity,
                  style: dropDownStyle,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )
              ],
            ),
            itemBuilder: (BuildContext context) {
              return widget.cities.map((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Text(value,style: dropDownItemStyle),
                );
              }).toList();
            },
          ),
          Spacer(),
          //Setting Button
          Icon(
            Icons.settings,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
