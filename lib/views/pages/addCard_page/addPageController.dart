import 'package:card_x/model/category_model.dart';
import 'package:card_x/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db/db_sqlite.dart';
import '../../../routes/app_routes.dart';
import '../../../services/remote_service.dart';
import '../../dialogs/custom_snackBar.dart';

class AddCardPageController extends GetxController {
  var cardModel = ContactModel(
    categoryId: 0,
    fullName: 'Unknown',
    designation: 'Unknown',
    phoneNumber: 'N/A',
    email: 'N/A',
    companyName: 'Unknown',
    webSite: 'N/A',
    address: 'Unknown',
  ).obs;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var categoryList = <CategoryModel>[].obs;
  RxString controllerText = ''.obs;

  @override
  void onInit() {
    ever(cardModel, (callback)=> print(cardModel.value));
    super.onInit();
  }

  @override
  void onReady() async {
    fetchAllData();
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    designationController.dispose();
    phoneController.dispose();
    emailController.dispose();
    websiteController.dispose();
    companyController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void fetchAllData() async {
    var category = await RemoteService.fetchAllCategoryByDB();
    if (category.isNotEmpty) {
      categoryList.add(CategoryModel(id: 0, categoryName: 'Select Category'));
      categoryList.addAll(category);
    }
  }

  void saveContact(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      insertItem(context, cardModel.value);
    }
  }

  insertItem(BuildContext context, ContactModel contactModel) {
    DBSQLite.insertItems(tableContact, contactModel.toMap()).then((id) {
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
      body: 'Card save done !!',
      iconData: Icons.check_circle,
    );
    Get.back();
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

  void setCardValue(String value) {
    ContactModel? contactModel;
  }
}
