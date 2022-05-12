import 'dart:math';

import 'package:card_x/db/db_sqlite.dart';
import 'package:card_x/model/contact_model.dart';
import 'package:card_x/model/category_model.dart';
import 'package:card_x/routes/app_routes.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../consts/app_images.dart';
import '../../utils/utils.dart';
import '../dialogs/custom_alertDialog.dart';
import '../pages/category_page/categoryPageController.dart';

class CategoryCardItemHorizontal extends GetView {
  final CategoryModel item;

  const CategoryCardItemHorizontal({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 120,
      width: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.9],
            colors: Utils.gradientColors[Random().nextInt(9)]),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          onTap: () {
            Get.toNamed(Routes.cardListPage, arguments: item.id);
          },
          child: Container(
            margin: EdgeInsets.all(16),
            child: Stack(
              children: [
                Center(child: Text(
                  item.categoryName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.vCard,
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                      Countup(
                          begin: 0,
                          end: 0,
                          duration: Duration(seconds: 3),
                          separator: ',',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: item.id != 0
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () {
                                CustomAlertDialog.customDialog(
                                    mContext: context,
                                    title: item.categoryName!,
                                    subTitle: '',
                                    message: 'Are you sure to delete it?',
                                    tableName: tableCategory,
                                    id: item.id!);},
                              child: Icon(Icons.delete, color: Colors.white, size: 24),
                            ),
                            Container(height: 30, width: 2, color: Colors.white,
                                margin: EdgeInsets.only(left: 8, right: 8)),
                            InkWell(
                              onTap: () {Get.toNamed(Routes.addCategoryPage, arguments: item);},
                              child: Icon(Icons.edit, color: Colors.white, size: 24,),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
