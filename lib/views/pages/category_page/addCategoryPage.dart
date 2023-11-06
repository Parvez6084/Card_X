import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../../model/category_model.dart';
import '../../widgets/text_field_container.dart';
import 'categoryPageController.dart';

class AddCategoryPage extends GetView<CategoryPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Get.arguments != null) {
      CategoryModel? argsData = Get.arguments as CategoryModel;
      controller.categoryId.value = argsData.id!;
      controller.categoryName.value = argsData.categoryName!;
      controller.categoryController.text = controller.categoryName.value;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: Text(
          Get.arguments != null ? 'Update Category' : 'Add Category',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: AppFonts.yesteryear,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.arguments != null
                  ? controller.updateCategory(context, controller.categoryModel.value.id!,
                      controller.categoryModel.value.categoryName!)
                  : controller.saveCategory(context);
            },
            icon: Icon(Icons.save, color: Colors.pinkAccent),
          ),
        ],
      ),
      body: SizedBox(
          height: size.height * .9,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Form(
                  key: controller.formKey,
                  child: TextFieldContainer(
                    onChanged: ( value) {
                      controller.categoryModel.value.categoryName = value;
                    },
                    keyboardType: TextInputType.text,
                    controller: controller.categoryController,
                    iconData: Icons.add,
                    lengthValue: 16,
                    label: 'Category',
                    isFieldRequired: true,
                  ),
                ),
              ],
            ),
          )),
    );
  }

}
