import 'package:flutter/material.dart';
import 'package:hotel_deals/Model/city.dart';


class CityCard extends StatelessWidget {

  final City city;
  const CityCard({Key key, this.city}) : super(key: key);

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
                  width: 160,
                  height: 210,
                  child: FadeInImage.assetNetwork(
                    image: city.imagePath,
                    placeholder: 'assets/images/loading.gif',
                    fit:BoxFit.cover,
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
                          Colors.black38.withOpacity(0.1)
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
                          Text(city.discount + '%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white)),
                          Text(city.date,
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
                        child: Text(city.discount + '%',
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
              Text('\$' + city.newPrice.toString(),
                  style: TextStyle(
                       fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                width: 40.0,
              ),
              Text('\$' + city.oldPrice.toString(),
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
