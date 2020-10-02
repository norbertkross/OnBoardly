import 'package:flutter/material.dart';
import 'package:onboardly/onboardly.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';

  // @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     platformVersion = await Onboardly.platformVersion;
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OnBoardly(
          screens: [
                OnBoardlyScreenItem(
                image: Image.asset("assets/loadicon.png"),
                description: Text("Hello 111"),
                backGroundColor: Colors.brown,
                ),
                OnBoardlyScreenItem(
                image: Image.asset("assets/brooke-lark-jUPOXXRNdcA-unsplash.jpg"),
                description: Text("Hello Two"),
                backGroundColor: Colors.red
                ),
                OnBoardlyScreenItem(
                image: Image.asset("assets/dan-gold-4_jhDO54BYg-unsplash.jpg"),
                description: Text("Hello 333"),
                backGroundColor: Colors.green,
                ),
                OnBoardlyScreenItem(
                image: Image.asset("assets/davide-cantelli-jpkfc5_d-DI-unsplash.jpg"),
                description: Text("Hello four"),
                backGroundColor: Colors.yellow,
                ),                
                OnBoardlyScreenItem(
                image: Image.asset("assets/jittlada_thai_restaurant_jakarta.jpg"),
                description: Text("Hello five"),
                backGroundColor: Colors.teal,
                ),                
                // OnBoardlyScreenItem(
                // image: Image.asset("assets/loadicon.png"),
                // description: Text("Hello six"),
                // backGroundColor: Colors.blue,
                // ),                
          ],
          onFinished: (){
            print("Sending you to home");
          },
          onSkip: (){
            print("Sending you to Skiped home");
          },
          activeColor: Colors.red,
          // shadow: HasShadow.yes,
          //disabledColor: ,
        ),
      ),
    );
  }
}
