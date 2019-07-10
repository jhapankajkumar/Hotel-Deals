import 'package:flutter/material.dart';

import 'ChoiceChipView.dart';

class ChoiceChipContainerView extends StatefulWidget {
  @override
  _ChoiceChipContainerViewState createState() =>
      _ChoiceChipContainerViewState();
}

class _ChoiceChipContainerViewState extends State<ChoiceChipContainerView> {
  bool isFlightSelected = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          child:
              ChoiceChipView(Icons.flight_takeoff, 'Flights', isFlightSelected),
          onTap: () {
            setState(() {
              isFlightSelected = true;
            });
          },
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          child: ChoiceChipView(Icons.hotel, 'Hotels', !isFlightSelected),
          onTap: () {
            setState(() {
              isFlightSelected = false;
            });
          },
        ),
      ],
    );
  }
}
