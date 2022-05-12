
import 'package:get/get.dart';

import '../favorite_page/favoritePageController.dart';
import '../home_page/homePageController.dart';

import '../scan_page/scanPageController.dart';
import 'dashboardPageController.dart';

class DashBoardPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardPageController>(() => DashBoardPageController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<ScanPageController>(() => ScanPageController());
    Get.lazyPut<FavoritePageController>(() => FavoritePageController());
  }
}
