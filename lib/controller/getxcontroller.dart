import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class getxcontroller extends GetxController{
  int counter = 0;

  void increment(){
    counter ++;
    update();
  }

  void decrement(){
    counter --;
    update();
  }



}