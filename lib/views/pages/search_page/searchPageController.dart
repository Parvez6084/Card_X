import 'package:card_x/db/db_sqlite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/contact_model.dart';

class SearchPageController extends GetxController {
  final searchController = TextEditingController();
  Rx<List<ContactModel>> foundItem = Rx<List<ContactModel>>([]);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void searchItem(String text) async{
    List<ContactModel> results = [];
    if(text.isEmpty){
      results = [];
    }else{
      results = await DBSQLite.searchValue(text);
    }
    foundItem.value = results;
  }
}
