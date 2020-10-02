library onboardly;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboardly/src/IntroScreen/OnBoardlyScreenItem.dart';
import 'package:onboardly/src/IntroScreen/dot_indicators.dart';
import 'package:onboardly/src/appState/appState.dart';
import 'package:onboardly/src/concentric-transitions/concentric_transition.dart';

// Export the OnBoardlyScreen Items Class In Order to be Accessible to the Libra
export 'package:onboardly/src/IntroScreen/OnBoardlyScreenItem.dart';



class OnBoardly extends StatefulWidget {

/// Provide a list of widgets you would want to use in each step Eg. 
/// ``` 
/// [  
/// OnBoardly(
///   screens:[
///     OnBoardlyScreenItem(
///     image: Image.asset("assets/loadicon.png"),
///     description: Text("Hello There"),
///     ),
///     OnBoardlyScreenItem(),
///     OnBoardlyScreenItem()
///     ]
/// 
/// ```
final List<OnBoardlyScreenItem> screens;

/// A function to run when walkthrough FINISHED. 
final Function onFinished;
/// A function to run when walkthrough SKIPPED.
final Function onSkip;

/// Provide this if you want a Custom Skip Text  
  final Text customSKIPtext;

/// Provide this if you want a Custom Done Text  
  final Text customDONEtext;

/// Provide this if you want a Custom Dot Indicator Color. The Default is green  
  final Color activeColor;

/// If your want the progress to be rounded  
/// ``` 
/// DotType.square
/// ``` 
  final DotType dotType;

/// If your want the progress to have shadow around to distinguish between color
/// ``` 
/// HasShadow.yes
/// ``` 
  final HasShadow shadow;

/// This is Main the OnBoarding Widget
  OnBoardly({
    @required this.screens,
    this.customSKIPtext,
    this.customDONEtext,
    this.activeColor,
    this.shadow,
    /// Interactive
    this.onFinished,
    this.onSkip,
    this.dotType,
  }):assert(screens.length >= 0,"Add a list of Walkthrough Screen Items");

  @override
  _OnBoardlyState createState() => _OnBoardlyState();
}
class _OnBoardlyState extends State<OnBoardly> {

final appsState = Get.put(AppState());

  @override
  Widget build(BuildContext context) {
  double mwidth = MediaQuery.of(context).size.width;    
  double mheight = MediaQuery.of(context).size.height;   


    return Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return false;
      },
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(0),
              children: [
              Container(
                color:widget.screens[appsState.currentStep.value].backGroundColor??Colors.red,
                height: mheight,
                width: mwidth,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 350,
                            width: 350,
                            child:widget.screens[appsState.currentStep.value].image,
                            ),
                          Container(
                            width: 310,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: widget.screens[appsState.currentStep.value].description,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
           ],
              ),
               Positioned(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
                child: Container(
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                ),
                child: DotIndicators(
                customSKIPtext: widget.customSKIPtext,
                customDONEtext: widget.customDONEtext,
                shadow: widget.shadow,  
                active: widget.activeColor,
                itemsLen: widget.screens.length,
                moveForward: appsState.currentStep.value == widget.screens.length-1?
                  widget.onFinished:
                 (){
                  appsState.changeStep(1);
                  Navigator.of(context).push(
                    ConcentricPageRoute(
                      builder: (_)=> OnBoardly(
                        screens: widget.screens,
                        activeColor: widget.activeColor,
                        customDONEtext: widget.customDONEtext,
                        customSKIPtext: widget.customSKIPtext,
                        onFinished: widget.onFinished,
                        onSkip: widget.onSkip,
                        dotType: widget.dotType,
                        shadow: widget.shadow,
                        ),));
                      print("Current Value "+appsState.currentStep.value.toString());
                },
                moveBack:appsState.currentStep.value == 0? widget.onSkip :
                 (){
                  appsState.changeStep(-1);
                  Navigator.pop(context);
                },
                ),
                ),
              ),
            ],
           ),     
      ),
      );
  }
}



enum DotType {
  square,
  circle
}
enum HasShadow {
  yes,
  no,
}