
import 'package:get/get.dart';

import 'welcomePageController.dart';

class WelcomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomePageController>(() => WelcomePageController());
  }
}


