import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../db/db_sqlite.dart';
import 'custom_snackBar.dart';

class CustomAlertDialog {
  static Future<bool?> customDialog(
      {
      required BuildContext mContext,
      required String title,
      String subTitle = '',
      required String message,
      required String tableName,
      required int id,
      }) {
     return showDialog(
        context: mContext,
        builder: (context) => AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(subTitle, style: TextStyle(fontSize: 12)),
                ],
              ),
              content: Text(message),
              actions: [
                TextButton(
                    child: Text('Cancel'),
                    onPressed: () => Get.back(result: false)),
                TextButton(
                  child: Text('Delete', style: TextStyle(color: Colors.pink)),
                  onPressed: () {
                    print('$tableName, and $id');
                    DBSQLite.deleteItemByID(tableName, id).then((value) {
                      Get.back(result: true);
                      CustomSnackBar.toastSnackBar(
                        context: context,
                        colors: Colors.greenAccent,
                        title: 'Success',
                        body: 'The item has been deleted!!',
                        iconData: Icons.check_circle,
                      );
                    });
                  },
                )
              ],
            ));
  }
}
