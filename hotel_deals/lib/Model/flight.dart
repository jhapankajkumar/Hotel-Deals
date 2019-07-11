import 'package:flutter/widgets.dart';

class Flight {
  final String rating;
  final String discount;
  final String flightName;
  final int oldPrice;
  final int newPrice;
  final String date;
  const Flight({this.rating, this.discount, this.flightName, this.oldPrice, this.newPrice, this.date});
}
