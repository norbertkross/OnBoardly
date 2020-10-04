import 'package:get/get.dart';


class AppState extends GetxController {


  var currentStep = 0.obs;

  void changeStep(int plusORminus){
    if(plusORminus == -1){
      currentStep.value--;
    }else{
      currentStep.value++;
    }
  }


}