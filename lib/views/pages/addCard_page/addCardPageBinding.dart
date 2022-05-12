
import 'package:get/get.dart';

import 'addPageController.dart';

class AddCardPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCardPageController>(() => AddCardPageController());
  }
}
