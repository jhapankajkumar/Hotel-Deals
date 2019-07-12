import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_deals/FlightListScreen/FlightListScreen.dart';

import '../Helper/Constants.dart';

class SearchTextFieldContainer extends StatefulWidget {
  final Function searchButtonTapped;
  SearchTextFieldContainer(this.searchButtonTapped);
  @override
  _SearchTextFieldContainerState createState() =>
      _SearchTextFieldContainerState();
}

final searchFieldController = TextEditingController(text: '');

class _SearchTextFieldContainerState extends State<SearchTextFieldContainer> {
  var text = '';
  String _errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: TextField(
          maxLengthEnforced: true,
          onChanged: (String text){
            print(text);
          },
          onEditingComplete: (){
            print('completed');
          },

          onSubmitted: (String string) {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          onTap: (){
            print('Tapped Text Field');
          },
          
          controller: searchFieldController,
          style: Constant.dropDownItemStyle,
          cursorColor: Color(0xFFF3791A),
          decoration: InputDecoration(
              hintText: 'Please enter city',
              errorText: _errorText,
              errorStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.0, color: Colors.red),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
              suffixIcon: Material(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 2.0,
                child: CupertinoButton(
                  onPressed: (){
                    if (searchFieldController.text.length == 0) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Constant.appTheme.primaryColor,
                            content: Text('Please enter city', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black87,))
                          ));
                    }
                    else {
                      widget.searchButtonTapped(searchFieldController.text);
                    }
                    
                  },
                  child:Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
                
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }


  String _getValidationError(String text) {
      String message;
      if( text.length > 5 ){
        return 'Please enter text more than 5 character';
      }

      return message;
  }
}
