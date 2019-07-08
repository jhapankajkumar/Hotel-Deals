import 'package:flutter/material.dart';


class HomeScreenTopContainer extends StatefulWidget {
  @override
  _HomeScreenTopContainerState createState() => _HomeScreenTopContainerState();
}

class _HomeScreenTopContainerState extends State<HomeScreenTopContainer>
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