import 'package:cloud_firestore/cloud_firestore.dart';

class City {
  final String imagePath, date, discount, cityName;
  final int oldPrice, newPrice;

  City.fromMap(Map<String, dynamic> map)
      : assert(map['cityName'] != null),
        assert(map['discount'] != null),
        assert(map['imagePath'] != null),
        assert(map['monthYear'] != null),
        assert(map['oldPrice'] != null),
        assert(map['newPrice'] != null),
        cityName = map['cityName'],
        discount = map['discount'],
        imagePath = map['imagePath'],
        date = map['monthYear'],
        oldPrice = map['oldPrice'],
        newPrice = map['newPrice'];
  City.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);
}
