import 'package:card_x/db/db_sqlite.dart';
import 'package:card_x/model/category_model.dart';
import 'package:card_x/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dialogs/custom_snackBar.dart';

class CategoryPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var categoryController = TextEditingController();
  var categoryModel = CategoryModel().obs;
  var categoryId = 0.obs;
  var categoryName = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void saveCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      insertItem(context, categoryModel.value);
      categoryController.clear();
    }
    update();
  }

  void updateCategory(BuildContext context, int id, String value) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      updateItem(context, id, value);
    }
    update();
  }

  insertItem(BuildContext context, CategoryModel categoryModel) {
    DBSQLite.insertItems(tableCategory, categoryModel.toMap()).then((id) {
      successSnackBar(context);
      Get.back();
    }).catchError((error) {
      failedSnackBar(context);
      throw error;
    });
    update();
  }

  updateItem(BuildContext context, int id, String value) {
    DBSQLite.updateCategoryByID(tableCategory, colCategoryName, id, value)
        .then((id) {
      successSnackBar(context);
      Get.back();
    }).catchError((error) {
      failedSnackBar(context);
      throw error;
    });
    update();
  }

  void successSnackBar(BuildContext context) {
    CustomSnackBar.toastSnackBar(
      context: context,
      colors: Colors.greenAccent,
      title: 'Success',
      body: 'Category save !!',
      iconData: Icons.check_circle,
    );
  }

  void failedSnackBar(BuildContext context) {
    CustomSnackBar.toastSnackBar(
      context: context,
      colors: Colors.pinkAccent,
      title: 'Failed',
      body: 'Failed to save !!',
      iconData: Icons.warning_amber_rounded,
    );
  }
}
