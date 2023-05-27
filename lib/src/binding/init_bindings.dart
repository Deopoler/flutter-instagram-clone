import 'package:flutter_instagram_clone/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}
