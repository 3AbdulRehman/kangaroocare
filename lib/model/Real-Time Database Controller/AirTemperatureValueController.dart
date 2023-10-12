

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class AirTemperatureValueController extends GetxController{
  final _database = FirebaseDatabase.instance.ref('esp');
  var value = "Loading".obs;

  void fetchTemperature() {
    _database.child('temperature').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        value.value = data.toString();
      } else {
        value.value = "Value not found";
      }
    });
  }

}