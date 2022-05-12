
import 'package:get/get.dart';

import 'detailsEditPageController.dart';

class DetailsEditPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsEditPageController>(() => DetailsEditPageController());
  }
}
