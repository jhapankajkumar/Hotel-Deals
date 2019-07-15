import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotel_deals/Common/CustomShapeClipper.dart';
import 'package:hotel_deals/CustomView/FlightListCell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_deals/Model/flight.dart';


// import '../Helper/Constants.dart';

class InheritedFlightListScreen extends InheritedWidget {
  final String fromLocation, toLocation;
  InheritedFlightListScreen({Widget child, this.fromLocation, this.toLocation}) : super (child:child);
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  
  static InheritedFlightListScreen of(BuildContext context) => context.inheritFromWidgetOfExactType(InheritedFlightListScreen);
  
}


class FlightListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Result'),
          elevation: 0.0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlightListTopPart(),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                child: Text(
                  'Best Deals for Next 6 months',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),

              StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('deals').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data != null) {
                      return _buildDetailList(context, snapshot.data.documents);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ));
  }
}

Widget _buildDetailList(
    BuildContext context, List<DocumentSnapshot> snapshots) {
  
  print(snapshots.length);
  return Container(
    child: ListView.builder(
      itemCount: snapshots.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return FlightListCell(flight: Flight.fromSnapshot(snapshots[index]),);
      },
    ),
  );
}

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFF47D15), Color(0xFFEF772C)])),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                elevation: 10.0,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              InheritedFlightListScreen.of(context).fromLocation,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Divider(color: Colors.grey, height: 20.0),
                            Text(
                              InheritedFlightListScreen.of(context).toLocation,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.import_export,
                          color: Colors.black,
                          size: 32,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

class FlightList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
