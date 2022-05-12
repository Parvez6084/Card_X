import 'package:card_x/consts/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboardPageController.dart';

class DashBoardPage extends GetView<DashBoardPageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Cards'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.scanCard)), label: 'Scan'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pinkAccent,
          onTap: controller.changePage,
          selectedIconTheme: IconThemeData(size: 28) ,
          unselectedItemColor: Colors.black54,
        ),
      ),
    );
  }
}
