import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../db/db_sqlite.dart';
import '../../../model/category_model.dart';
import '../favorite_page/favoritePage.dart';
import '../home_page/homePage.dart';
import '../scan_page/scanPage.dart';

class DashBoardPageController extends GetxController {
  static DashBoardPageController get to => Get.find();
  var currentIndex = 0.obs;
  static var itemsCategory = [
    CategoryModel(id: 0, categoryName: 'All Card'),
    CategoryModel(id: 1, categoryName: 'Office'),
    CategoryModel(id: 2, categoryName: 'Friends'),
  ];

  final pages = [HomePage(), ScanPage(), FavoritePage()];

  Widget get currentPage => pages[currentIndex()];

  changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    DBSQLite.dbSqLite.getAllCategory().then((value) {
      if(value.isEmpty){
        for(var item in itemsCategory){
          insertItem(item);
          print('Data DB Done');
        }
      }
      print('Data $value');
    });
  }

  insertItem(CategoryModel categoryModel) {
    DBSQLite.insertItems(tableCategory, categoryModel.toMap())
        .then((id) {})
        .catchError((error) {
          print('error $error');
      throw error;
    });
    update();
  }
}
