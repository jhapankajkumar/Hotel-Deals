import 'package:cloud_firestore/cloud_firestore.dart';

class Flight {
  final String rating, date, discount, flightName;
  final int oldPrice, newPrice;

  Flight.fromMap(Map<String, dynamic> map)
      : flightName = map['airlines'],
        discount = map['discount'],
        rating = map['rating'],
        date = map['date'],
        oldPrice = map['oldPrice'],
        newPrice = map['newPrice'];

 

  Flight.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);
}
