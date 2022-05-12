import 'package:card_x/model/category_model.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../widgets/businessCard_item.dart';
import '../../widgets/text_field_container.dart';
import 'addPageController.dart';

class AddCardPage extends GetView<AddCardPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Add Card',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: AppFonts.yesteryear,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.saveContact(context);
            },
            icon: Icon(Icons.save, color: Colors.pinkAccent),
          ),
        ],
      ),
      body: DirectSelectContainer(
        child: SingleChildScrollView(
          child: Container(
            height: 800,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Obx((){
              return Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: controller.categoryList.isNotEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BusinessCard(item: controller.cardModel.value),
                    SizedBox(height: 8),
                    Text(
                      'Add Information',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38,
                        fontFamily: AppFonts.yesteryear,
                      ),
                    ),
                    Container(
                      child: Card(
                        elevation: 2,
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                  child: DirectSelectList<CategoryModel>(
                                      values: controller.categoryList,
                                      defaultItemIndex: 0,
                                      itemBuilder: (value)  {
                                        return getDropDownMenuItem(value);
                                      },
                                      focusedItemDecoration:
                                      _getDslDecoration(),
                                      onItemSelectedListener:
                                          (item, index, context)  {
                                        controller.cardModel.value.categoryId = item.id!;
                                      }),
                                  padding: EdgeInsets.only(left: 16)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.unfold_more,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widgetEditTextField()
                  ],
                )
                    : Center(
                    child: Text(
                      'Loading...',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
              );
            })
          ),
        ),
      ),
    );
  }

  Widget widgetEditTextField() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 16),
        children: [
          TextFieldContainer(
            onChanged: (value) {controller.cardModel.value.fullName = value;},
            isFieldRequired: true,
            keyboardType: TextInputType.name,
            controller: controller.nameController,
            iconData: Icons.person,
            lengthValue: 24,
            label: 'Name',
          ),
          SizedBox(height: 8),
          TextFieldContainer(
            onChanged: (value) {
              controller.cardModel.value.designation = value;
            },
            keyboardType: TextInputType.text,
            controller: controller.designationController,
            iconData: Icons.work,
            lengthValue: 24,
            label: 'Designation',
          ),
          SizedBox(height: 8),
          TextFieldContainer(
            onChanged: (value) {
              controller.cardModel.value.phoneNumber = value;
            },
            isFieldRequired: true,
            keyboardType: TextInputType.phone,
            controller: controller.phoneController,
            iconData: Icons.phone,
            lengthValue: 11,
            label: 'Phone',
          ),
          SizedBox(height: 8),
          TextFieldContainer(
            onChanged: (value) {
              controller.cardModel.value.email = value;
            },
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailController,
            iconData: Icons.email,
            lengthValue: 32,
            label: 'Email',
          ),
          SizedBox(height: 8),
          TextFieldContainer(
            onChanged: (value) {
              controller.cardModel.value.webSite = value;
            },
            keyboardType: TextInputType.emailAddress,
            controller: controller.websiteController,
            iconData: Icons.vpn_lock,
            lengthValue: 32,
            label: 'Website',
          ),
          SizedBox(height: 8),
          TextFieldContainer(
            onChanged: (value) {
              controller.cardModel.value.companyName = value;
            },
            keyboardType: TextInputType.name,
            controller: controller.companyController,
            iconData: Icons.home_work,
            lengthValue: 32,
            label: 'Company Name',
          ),
          SizedBox(height: 8),
          TextFieldContainer(
            onChanged: (value) {
              controller.cardModel.value.address = value;
            },
            isFieldRequired: true,
            keyboardType: TextInputType.streetAddress,
            controller: controller.addressController,
            iconData: Icons.location_on,
            lengthValue: 60,
            maxLineValue: 4,
            label: 'Address',
          ),
        ],
      ),
    );
  }

  DirectSelectItem<CategoryModel> getDropDownMenuItem(CategoryModel value) {
    return DirectSelectItem<CategoryModel>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value.categoryName!);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }
}
