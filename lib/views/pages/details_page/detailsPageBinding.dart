
import 'package:get/get.dart';

import 'detailsPageController.dart';

class DetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsPageController>(() => DetailsPageController());
  }
}
