
import 'package:get/get.dart';

class SetAirTemperatureController extends GetxController{

  RxInt xy =1.obs;



  void increment(){

    if(xy.value<40){
      xy.value++;
    }
    update();

  }

  void decrement(){
    if(xy.value>1){
      xy.value--;
    }
    update();
  }


}