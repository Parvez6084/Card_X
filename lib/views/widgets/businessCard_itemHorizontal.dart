import 'dart:io';
import 'dart:math';

import 'package:card_x/model/contact_model.dart';
import 'package:card_x/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/app_images.dart';
import '../../utils/utils.dart';
import '../dialogs/custom_alertDialog.dart';
import '../dialogs/image_dialog.dart';

class BusinessCardItemHorizontal extends GetView {
  final ContactModel item;

  const BusinessCardItemHorizontal({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      confirmDismiss: (_) => CustomAlertDialog.customDialog(
          title: item.fullName!,
          subTitle: item.phoneNumber!,
          message: 'Are you sure to delete this card ?',
          mContext: context,
          id: item.id!,
          tableName: tableContact),
      background: Container(
        margin: const EdgeInsets.all(8),
        height: 124,
        width: size.width * .9,
        color: Colors.pink,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 32,
                ),
                Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
      ),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(8),
        height: 124,
        width: size.width * .9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: Utils.gradientColors[Random().nextInt(9)]),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Get.toNamed(Routes.detailsPage, arguments: [item]),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                      top: 16,
                      left: 16,
                      child: Text(item.fullName!,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700))),
                  Positioned(
                      top: 40,
                      left: 16,
                      child: Text(item.designation!,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w400))),
                  Positioned(
                    top: 70,
                    left: 16,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('+88 ' + item.phoneNumber!,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    letterSpacing: 2)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(item.email!,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (_) => ImageDialog(item.imagePath == 'N/A'
                                ? AppImages.no_image
                                : item.imagePath));
                      },
                      child: Align(
                          alignment: Alignment.topRight,
                          child: item.imagePath == 'N/A'
                              ? Image.asset(
                                  AppImages.no_image,
                                  fit: BoxFit.fill,
                                  height: 124,
                                  width: 140,
                                )
                              : Image.file(
                                  File(item.imagePath!),
                                  fit: BoxFit.fill,
                                  height: 124,
                                  width: 140,
                                ))),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          size: 24,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
