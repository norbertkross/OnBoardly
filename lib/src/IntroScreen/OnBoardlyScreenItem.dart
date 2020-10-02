
   import 'package:flutter/material.dart';


class OnBoardlyScreenItem {
  /// The Image Or Widget You Want to Use. Eg. 
  /// ```
  /// Image.asset()
  /// Image.network(),
  /// ```
  final Widget image;  
  /// Background Color Of the Page
  final Color backGroundColor;  
  /// The Description Text for the Image. Takes a Text() Widget  
  final Text description;  

/// Each OnBoardlyScreenItem represents a single walkthrough page
  OnBoardlyScreenItem({
    this.backGroundColor,
    @required this.image,
    @required this.description,    
  }): assert(image != null,"Provide Image Widget"),
      assert(description != null,"provide description text");
}

