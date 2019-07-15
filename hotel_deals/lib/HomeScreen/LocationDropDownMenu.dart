import 'package:flutter/material.dart';
import 'package:hotel_deals/Model/location.dart';
import '../Helper/Constants.dart';

class LocationDropDownMenu extends StatefulWidget {
  final List<Location> cities;
  final Function dropDownValueChanged;

  LocationDropDownMenu(this.cities, this.dropDownValueChanged);

  @override
  _LocationDropDownMenuState createState() => _LocationDropDownMenuState();
}

class _LocationDropDownMenuState extends State<LocationDropDownMenu> {
  var selectedIndex = 0;
  Location selectedCity;
  var onSelected;

  @override
  void initState() {
    selectedIndex = 0;
    selectedCity = widget.cities[0];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.dropDownValueChanged(selectedCity);
    });
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
              widget.dropDownValueChanged(city);
            },
            child: Row(
              children: <Widget>[
                Text(
                  selectedCity.name,
                  style: Constant.dropDownStyle,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )
              ],
            ),
            itemBuilder: (BuildContext context) {
              return widget.cities.map((Location city) {
                return PopupMenuItem<Location>(
                  value: city,
                  child: Text(city.name, style: Constant.dropDownItemStyle),
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
