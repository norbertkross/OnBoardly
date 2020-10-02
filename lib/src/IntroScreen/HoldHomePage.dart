import 'dart:io';

import 'package:flutter/material.dart';

class HoldHome extends StatefulWidget {
  final Widget theHome;
  HoldHome({this.theHome});

  @override
  _HoldHomeState createState() => _HoldHomeState();
}

class _HoldHomeState extends State<HoldHome> {
_onWillPop()async{
   exit(0);
 return false;

}  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop:() => _onWillPop(),
          child: Container(
        color: Colors.black,
        child: widget.theHome,
      ),
    );
  }
}