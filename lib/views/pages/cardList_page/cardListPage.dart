import 'package:card_x/model/contact_model.dart';
import 'package:card_x/views/widgets/businessCard_item.dart';
import 'package:card_x/views/widgets/businessCard_itemHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../../db/db_sqlite.dart';
import '../../../routes/app_routes.dart';
import 'cardListPageController.dart';

class CardListPage extends GetView<CardListPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var argData = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: Text(
          'Card List',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: AppFonts.yesteryear,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.searchPage),
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.addCardPage);
            },
            icon: Icon(Icons.add, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              bool value = controller.isListMode ? false : true;
              print('<<<$value');
              controller.listModeUpdate(value);
            },
            icon: controller.isListMode == true
                ? Icon(Icons.list, color: Colors.black)
                : Icon(Icons.apps, color: Colors.black),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height * .9,
        child: FutureBuilder<List<ContactModel>>(
            future: argData == 0
                ? DBSQLite.dbSqLite.fetchAllContract()
                : DBSQLite.dbSqLite.fetchContractByCategoryId(argData),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return data.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.length,
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            controller.isListMode == true
                                ? BusinessCardItemHorizontal(item: data[index])
                                : BusinessCard(item: data[index]))
                    : Center(
                        child: Text(
                        'No Data',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ));
              }
              if (snapshot.hasError) {
                return Text('Fail to face data');
              }
              return Center(
                child: Text(
                  'Ops!!\nNo Data Found',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.yesteryear,
                      fontSize: 32),
                ),
              );
            }),
      ),
    );
  }
}
