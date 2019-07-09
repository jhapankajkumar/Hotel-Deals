import 'package:flutter/material.dart';

class SearchTextFieldContainer extends StatefulWidget {

  @override
  _SearchTextFieldContainerState createState() => _SearchTextFieldContainerState();
}

var dropDownItemStyle = TextStyle(color: Colors.black, fontSize: 18.0);

class _SearchTextFieldContainerState extends State<SearchTextFieldContainer> {
  var text = 'Boston';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: TextField(
          controller: TextEditingController(text: text),
          style: dropDownItemStyle,
          cursorColor: Color(0xFFF3791A),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
              suffixIcon: Material(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 2.0,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
