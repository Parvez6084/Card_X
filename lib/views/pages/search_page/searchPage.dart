import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../widgets/businessCard_itemHorizontal.dart';
import '../../widgets/text_field_container.dart';
import 'searchPageController.dart';

class SearchPage extends GetView<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text('Search',
          style: TextStyle(fontSize: 24, color: Colors.black,
              fontFamily: AppFonts.yesteryear, fontWeight: FontWeight.w400))),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: size.width * .9,
              child: TextFieldContainer(
                  controller: controller.searchController,
                  keyboardType: TextInputType.text,
                  label: 'Search',
                  lengthValue: 24,
                  iconData: Icons.search,
                  onChanged: (value) => controller.searchItem(value)),
            ),
            Expanded(
              child: Obx((){
                return controller.foundItem.value.isNotEmpty
                    ? ListView.builder(
                    itemCount: controller.foundItem.value.length,
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        BusinessCardItemHorizontal(item: controller.foundItem.value[index]))
                    : Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ));
              })
            ),
          ],
        ),
      ),
    );
  }
}
