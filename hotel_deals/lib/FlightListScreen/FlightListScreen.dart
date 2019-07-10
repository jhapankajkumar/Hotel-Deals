import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotel_deals/Common/CustomShapeClipper.dart';
import 'package:hotel_deals/CustomView/FlightListCell.dart';

// import '../Helper/Constants.dart';

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
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 10),
                child: Text('Best Deals for Next 6 months',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black),),
              ),
              Container(
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: flightCards,
                ),
              ),
            ],
          ),
        ));
  }
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
                              'Boston (BOS)',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Divider(
                                 color: Colors.grey, height: 20.0),
                            Text(
                              'New York City (JFK)',
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

List<FlightListCell> flightCards = [
  FlightListCell(
    date: 'Feb 2009',
    discount: '45%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Cathay Pacific',
    rating: '4.9',
  ),
  FlightListCell(
    date: 'June 2018',
    discount: '12%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Emirates',
    rating: '4.8',
  ),
  FlightListCell(
    date: 'Apr 2007',
    discount: '13%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Air India',
    rating: '4.5',
  ),
  FlightListCell(
    date: 'Nov 2009',
    discount: '32%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Jet Airways',
    rating: '4.0',
  ),
  FlightListCell(
    date: 'Jan 2012',
    discount: '21%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Singapore Airlines',
    rating: '4.8',
  ),
  FlightListCell(
    date: 'Jan 2012',
    discount: '21%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Singapore Airlines',
    rating: '4.8',
  ),
  FlightListCell(
    date: 'Jan 2012',
    discount: '21%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Singapore Airlines',
    rating: '4.8',
  ),FlightListCell(
    date: 'Jan 2012',
    discount: '21%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Singapore Airlines',
    rating: '4.8',
  ),
  FlightListCell(
    date: 'Jan 2012',
    discount: '21%',
    oldPrice: '\$67387',
    price: '\$4563',
    flightName: 'Singapore Airlines',
    rating: '4.8',
  )
];
