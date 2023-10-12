
import 'package:get/get.dart';

class SetSp02Maximum extends GetxController{

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

class SetSp02Minimum extends GetxController{

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





