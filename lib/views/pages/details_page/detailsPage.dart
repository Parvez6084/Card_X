import 'dart:io';

import 'package:card_x/consts/app_images.dart';
import 'package:card_x/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../../routes/app_routes.dart';
import '../../dialogs/custom_alertDialog.dart';
import 'detailsPageController.dart';

class DetailsPage extends GetView<DetailsPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ContactModel? contactModel;
    if (Get.arguments != null) {
      ContactModel? argsData = Get.arguments as ContactModel;
      contactModel = argsData;
      print(contactModel);
    }

    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: Text(
          'Details',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: AppFonts.yesteryear,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.detailsEditPage),
            icon: Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                left: 8,
                right: 8,
                top: 60,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 300,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 16,
                        right: 16,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${contactModel?.fullName}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                              Text('${contactModel?.designation}',
                                  style: TextStyle(fontSize: 14)),
                              Text('${contactModel?.companyName}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54)),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.launchURL(
                                            'tel:${contactModel?.phoneNumber}');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.phone_outlined,
                                            size: 24,
                                            color: Colors.pinkAccent,
                                          ),
                                          Text('Call',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.pinkAccent,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 2,
                                      color: Colors.black38,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.launchURL(
                                            'mailto:${contactModel?.email}');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.email_outlined,
                                            size: 24,
                                            color: Colors.pinkAccent,
                                          ),
                                          Text('Email',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.pinkAccent,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 2,
                                      color: Colors.black38,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.launchURL(
                                            'https:${contactModel?.webSite}');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.vpn_lock,
                                            size: 24,
                                            color: Colors.pinkAccent,
                                          ),
                                          Text('WebSite',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.pinkAccent,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 24,
                right: 24,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                      child: contactModel?.imagePath == 'N/A'
                          ? Image.asset(AppImages.no_image,
                              fit: BoxFit.fill, height: 200)
                          : Image.file(
                              File('${contactModel?.imagePath}'),
                              fit: BoxFit.fill,
                              height: 200,
                              width: size.width,
                            )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Positioned(
                top: 400,
                left: 16,
                child: Column(
                  children: [
                    Text('Basic Information',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              color: Colors.pinkAccent,
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('+880 ${contactModel?.phoneNumber}'),
                          ],
                        ),
                        SizedBox(width: 16),
                        Center(
                            child: Container(
                          height: 60,
                          width: 2,
                          color: Colors.black38,
                        )),
                        SizedBox(width: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.pinkAccent,
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('${contactModel?.email}'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    InkWell(
                        onTap: () {},
                        child: Text('${contactModel?.webSite}',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black))),
                    SizedBox(height: 8),
                    SizedBox(
                        width: size.width * .8,
                        child: Text('${contactModel?.address}',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomAlertDialog.customDialog(
              mContext: context,
              title: contactModel?.fullName?? 'Unknown' ,
              subTitle: contactModel?.phoneNumber?? 'Unknown',
              message: 'Are you sure to delete it?',
              tableName: tableContact,
              id: contactModel?.id ?? 0 ).then((value) => Get.back());
        },
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 24,
        ),
        backgroundColor: Colors.pinkAccent,
        tooltip: 'Delete',
        elevation: 4,
        splashColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
