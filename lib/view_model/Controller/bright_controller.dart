import 'package:get/get.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';

class BrightnessController extends GetxController {
  RxDouble brightness = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    initPlatformBrightness();
  }

  Future<void> initPlatformBrightness() async {
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    } catch (e) {
      bright = 1.0;
    }
    brightness.value = bright;
  }

  void setBrightness(double value) {
    brightness.value = value;
    update();
    FlutterScreenWake.setBrightness(value);
  }
}
