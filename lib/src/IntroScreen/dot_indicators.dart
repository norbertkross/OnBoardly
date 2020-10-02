import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboardly/onboardly.dart';
import 'package:onboardly/src/appState/appState.dart';


class DotIndicators extends StatefulWidget {

  final int itemsLen;
  final Function moveForward;
  final Function moveBack;
  final DotType dotType;
  final HasShadow shadow;
  final Color active;
  final Text customSKIPtext;
  final Text customDONEtext;

  DotIndicators({
  this.itemsLen,
  this.moveBack,
  this.moveForward,
  this.dotType,
  this.shadow,
  this.active,
  this.customSKIPtext,
  this.customDONEtext
  });


  @override
  _DotIndicatorsState createState() => _DotIndicatorsState();
}

class _DotIndicatorsState extends State<DotIndicators> {
  final appState = Get.put(AppState());

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Obx(() => Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [  

                GestureDetector(
                  onTap: widget.moveBack,
                  child: appState.currentStep >0? 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.black.withOpacity(widget.shadow == HasShadow.yes? .2:0.0),
                      child: Icon(Icons.chevron_left,
                       color:widget.active != null? widget.active: Theme.of(context).primaryColor,
                      ),
                    ),
                  ): widget.customSKIPtext != null? widget.customSKIPtext: Text("Skip",style: TextStyle(color: Theme.of(context).canvasColor,fontWeight: FontWeight.bold,fontSize: 18),),
                  ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Colors.black.withOpacity(widget.shadow == HasShadow.yes? .2:0.0),
                    child: Wrap(
                      children: [
               if(widget.itemsLen <= 3)              
                    for(int i=0; i <= widget.itemsLen-1;i++)
                    highLowColor(i)

                    else 
                    for(int i=0; i <= 2;i++)              
                    highLowColor(i),

                    if(widget.itemsLen>=3 && appState.currentStep >=3)
                    highColor()
                    else if(appState.currentStep <3 && widget.itemsLen >3)
                      lowColor()

                      ],
                    ),
                  ),
                ),

                GestureDetector(
                   onTap:widget.moveForward,
                   child: appState.currentStep.value == widget.itemsLen-1?
                  widget.customDONEtext != null? widget.customDONEtext: Text("Done",
                   style: TextStyle(color: Theme.of(context).canvasColor,fontWeight: FontWeight.bold,fontSize: 18),)
                   :ClipRRect(
                     borderRadius: BorderRadius.circular(20),
                     child: Container(
                       color: Colors.black.withOpacity(widget.shadow == HasShadow.yes? .2:0.0),
                       child: Icon(Icons.chevron_right,
                       color:widget.active != null? widget.active: Theme.of(context).primaryColor
                       ),
                     ),
                   ),
                  ),                       
              ],
            ),
         ),
        ),
        ),
      ),
    );
  }



        Widget highColor(){
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.dotType == null || widget.dotType == DotType.circle?20.0:0.0),
              child: Container(
                color: widget.active != null? widget.active: Theme.of(context).primaryColor,
                height: 15,
                width: 10,
              ),
            ),
          );
        }

        Widget lowColor(){
      return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.dotType == null || widget.dotType == DotType.circle?20.0:0.0),
                    child: Container(
                      color: widget.active != null? widget.active.withOpacity(.3): Theme.of(context).accentColor.withOpacity(.4),
                      height: 15,
                      width: 10,
                    ),
                  ),
                );
        }


        Widget highLowColor(int i){
        return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.dotType == null || widget.dotType == DotType.circle?20.0:0.0),
                  child: Container(
                    color: appState.currentStep.value == i?
                     widget.active != null? widget.active: Theme.of(context).primaryColor:
                     widget.active != null? widget.active.withOpacity(.3): Theme.of(context).accentColor.withOpacity(.4),
                    height: 15,
                    width: 10,
                  ),
                ),
              );
        }




}