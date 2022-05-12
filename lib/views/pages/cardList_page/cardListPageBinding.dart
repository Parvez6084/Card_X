
import 'package:get/get.dart';

import 'cardListPageController.dart';

class CardListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardListPageController>(() => CardListPageController());
  }
}
