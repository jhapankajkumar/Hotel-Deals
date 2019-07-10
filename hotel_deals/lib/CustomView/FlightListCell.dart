import 'package:flutter/material.dart';
import 'package:hotel_deals/Helper/Constants.dart';

class FlightListCell extends StatelessWidget {
  final String price, oldPrice, date, flightName, rating, discount;

  const FlightListCell({Key key, this.price, this.oldPrice, this.date, this.flightName, this.rating, this.discount}) : super(key: key);

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
                        Text(price,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(width: 20,),
                        Text(oldPrice,style: TextStyle(fontSize: 16.0,decoration: TextDecoration.lineThrough, color: Colors.grey),),
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
                            Text(date,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
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
                            Text(flightName,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
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
                            Text(rating,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
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
            
            
            child: Text(discount,style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Constant.appTheme.primaryColor),),
          ),
        ),
      ],
    );
  }
}
