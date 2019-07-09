import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  const CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.blueAccent,
                  width: 160,
                  height: 210,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  height: 60,
                  width: 160,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black12.withOpacity(0.1)
                        ])),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cityName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white)),
                          Text(monthYear,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  color: Colors.white)),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        child: Text('$discount%',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 0.0,
              ),
              Text('\$$newPrice',
                  style: TextStyle(
                       fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                width: 40.0,
              ),
              Text('($oldPrice)',
                  style: TextStyle(
                    fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
