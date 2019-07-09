import 'package:flutter/material.dart';


class  HomeScreenBottomContainer extends StatefulWidget {
  @override
  _HomeScreenBottomContainerState createState() => _HomeScreenBottomContainerState();
}

class _HomeScreenBottomContainerState extends State<HomeScreenBottomContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}