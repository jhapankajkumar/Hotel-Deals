import 'package:flutter/material.dart';


class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);

    var endPointOne = Offset(size.width * .5, size.height-30);
    var controlePointOne = Offset(size.width * .25, size.height - 50);

    path.quadraticBezierTo(controlePointOne.dx, controlePointOne.dy, endPointOne.dx,endPointOne.dy);

    var endPointTwo = Offset(size.width , size.height - 80);
    var controlePointTwo = Offset(size.width * .75, size.height - 10);

    path.quadraticBezierTo(controlePointTwo.dx, controlePointTwo.dy, endPointTwo.dx,endPointTwo.dy);


    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}