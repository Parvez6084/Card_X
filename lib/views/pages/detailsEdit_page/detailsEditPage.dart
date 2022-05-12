import 'dart:io';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../../consts/app_images.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/text_field_container.dart';
import 'detailsEditPageController.dart';

class DetailsEditPage extends GetView<DetailsEditPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.lines = controller.data[1];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Details Edit',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: AppFonts.yesteryear,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.detailsEditPage),
            icon: Icon(Icons.save, color: Colors.pinkAccent),
          ),
        ],
      ),
      body: DirectSelectContainer(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                        child: controller.data[0] != null
                            ? Image.file(
                                File(controller.data[0]),
                                fit: BoxFit.fill,
                                height: 220,
                                width: size.width,
                              )
                            : Image.asset(
                                AppImages.no_image,
                                fit: BoxFit.fill,
                                height: 220,
                                width: size.width,
                              )),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Edit Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                      fontFamily: AppFonts.yesteryear,
                    ),
                  ),
                  SizedBox(height: 8),
                  Card(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                                child: DirectSelectList<String>(
                                    values: controller.optionsData,
                                    defaultItemIndex: 0,
                                    itemBuilder: (String value) => getDropDownMenuItem(value),
                                    focusedItemDecoration: _getDslDecoration(),
                                    onItemSelectedListener: (item, index, context) {
                                      Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
                                    }),
                                padding: EdgeInsets.only(left: 12))),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.unfold_more,
                            color: Colors.pinkAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: size.height,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 16),
                        itemCount: controller.lines.length,
                        itemBuilder: (context, i) => TextFormField(
                                      controller: controller.nameController,
                                      validator: (value) =>
                                          value!.isEmpty ? 'Field is empty' : null,
                                      decoration: InputDecoration(
                                        labelText: 'Unknown',
                                        border: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(8))),
                                        prefixIcon: Icon(Icons.email),
                                        //  suffixIcon: controller.text.isNotEmpty ? IconButton(icon: const Icon(Icons.close, color: Colors.pinkAccent,), onPressed: () => controller.clear()) : null
                                      ),
                                      keyboardType: TextInputType.text,
                                      maxLength: 50,
                                      onChanged: (String value) {},
                                      maxLines: 1,
                                    ),

                            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        TextFieldContainer(
          onChanged: ( value) {},
          keyboardType: TextInputType.name,
          controller: controller.nameController,
          iconData: Icons.person,
          lengthValue: 18,
          label: 'Card holder Name',
        ),
        TextFieldContainer(
          onChanged: ( value) {},
          keyboardType: TextInputType.phone,
          controller: controller.phoneController,
          iconData: Icons.phone,
          lengthValue: 11,
          label: 'Phone',
        ),
        TextFieldContainer(
          onChanged: ( value) {},
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          iconData: Icons.email,
          lengthValue: 18,
          label: 'Email',
        ),
        TextFieldContainer(
          onChanged: ( value) {},
          keyboardType: TextInputType.emailAddress,
          controller: controller.websiteController,
          iconData: Icons.vpn_lock,
          lengthValue: 24,
          label: 'Website',
        ),
        TextFieldContainer(
          onChanged: ( value) {},
          keyboardType: TextInputType.name,
          controller: controller.companyController,
          iconData: Icons.home_work,
          lengthValue: 24,
          label: 'Company Name',
        ),
        TextFieldContainer(
          onChanged: ( value) {},
          keyboardType: TextInputType.streetAddress,
          controller: controller.addressController,
          iconData: Icons.location_on,
          lengthValue: 50,
          maxLineValue: 4,
          label: 'Address',
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
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
