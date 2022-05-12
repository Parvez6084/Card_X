
import 'package:get/get.dart';

import 'categoryPageController.dart';

class CategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryPageController>(() => CategoryPageController());
  }
}
