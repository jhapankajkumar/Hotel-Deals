import 'package:flutter/material.dart';
import 'package:hotel_deals/Helper/Constants.dart';
import 'package:hotel_deals/Model/flight.dart';

class FlightListCell extends StatelessWidget {
  final Flight flight;

  const FlightListCell({Key key, this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
          height: 120,
          child: Card(
            elevation: 10.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.0, color: Colors.grey.withOpacity(.5), style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Price Row
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        flight.newPrice > 0 ? Text('\$' + flight.newPrice.toString(),style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),):null,
                        SizedBox(width: 20,),
                        flight.oldPrice > 0 ? Text( '\$' + flight.oldPrice.toString(),style: TextStyle(fontSize: 16.0,decoration: TextDecoration.lineThrough, color: Colors.grey),) : null,
                      ],
                    ),
                    //Flight Detail Row
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Date And Time
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                            Icon(Icons.inbox,color: Colors.black,size: 15,),
                            SizedBox(width: 10,),
                            flight.date.length >0 ? Text(flight.date,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),) : null,
                          ],),
                        ),
                        //Flight Name
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                            Icon(Icons.flight,color: Colors.black,size: 15,),
                            SizedBox(width: 10,),
                            flight.flightName.length > 0 ?  Text(flight.flightName,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),) : null,
                          ],),
                        ),
                        //Rating
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                            Icon(Icons.star,color: Colors.black,size: 15,),
                            SizedBox(width: 10,),
                            flight.rating.length > 0  ? Text(flight.rating,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),) : null,
                          ],),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
        //For Discount 
        Positioned(
          right: 10,
          top: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(
              color: Constant.appTheme.primaryColor.withOpacity(.2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
            child: flight.discount.length > 0 ? Text(flight.discount.toString() + '%',style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.deepOrange),) : null,
          ),
        ),
      ],
    );
  }
}

mixin $ {
}
