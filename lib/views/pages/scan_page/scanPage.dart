import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import '../../../consts/app_fonts.dart';
import '../../../consts/app_images.dart';
import '../../../routes/app_routes.dart';
import 'scanPageController.dart';

class ScanPage extends GetView<ScanPageController> {
  @override
  Widget build(BuildContext context) {
    controller.imagePath.value = null;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Scan',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: AppFonts.yesteryear,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                      child: controller.imagePath.value != null
                          ? Image.file(
                              File(controller.imagePath.value!),
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
                )),
            SizedBox(
              height: 24,
            ),
            Text('Choose One',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: <Widget>[
                  Card(
                    semanticContainer: true,
                    color: Colors.greenAccent,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          controller.imageSource = ImageSource.camera;
                          controller.scanImage(context);
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera, size: 40, color: Colors.white),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                      fontSize:14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    color: Colors.pinkAccent,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          controller.imageSource = ImageSource.gallery;
                          controller.scanImage(context);
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.image, size: 40, color: Colors.white),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    semanticContainer: true,
                    color: Colors.lightBlueAccent,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {Get.toNamed(Routes.addCardPage);},
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add, size: 40, color: Colors.white),
                                Text(
                                  'Manual',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
