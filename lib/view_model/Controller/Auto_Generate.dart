import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/screen/home.dart';

class NumberController extends GetxController {
  var number = 0.obs;

  Future<void> _initSharedPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    // Retrieve the stored counter value
    number.value = _prefs.getInt('counter') ?? 0;
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize SharedPreferences
    _initSharedPreferences();
  }

  void incrementNumber() {
    SharedPreferences.getInstance().then((_prefs) {
      // Retrieve the stored counter value
      int previousCounter = _prefs.getInt('counter') ?? 0;
      // Delete the previous counter value
      _prefs.remove('counter');
      // Update the counter value
      number.value = previousCounter + 1;
      // Store the new counter value
      _prefs.setInt('counter', number.value);
      update();
    });


  }


  String getFormattedNumber() {
    return number.value.toString().padLeft(4, '0');
  }
}
