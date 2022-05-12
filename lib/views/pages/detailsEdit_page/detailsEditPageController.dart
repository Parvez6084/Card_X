import 'package:card_x/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsEditPageController extends GetxController{

  var data = Get.arguments;
  ContactModel? cardModel;
  List<String> lines = [];
  List<String> optionsData = [
    'Select Option',
    'Name',
    'Designation',
    'Phone',
    'Email',
    'Website',
    'Company Name',
    'Address'
  ];
  final formKey = GlobalKey<FormState>();
  List<TextEditingController> textController =[];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var websiteController = TextEditingController();
  var companyController = TextEditingController();
  var addressController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }




}