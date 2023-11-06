
import 'package:card_x/views/widgets/businessCard_itemHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../../db/sample_data.dart';
import '../../../routes/app_routes.dart';
import 'favoritePageController.dart';

class FavoritePage extends GetView<FavoritePageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Favorite List', style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: AppFonts.yesteryear, fontWeight: FontWeight.w400),),
        actions:[
          IconButton(
           onPressed: () => Get.toNamed(Routes.searchPage),
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.apps, color: Colors.black),
          ),
        ],
      ),
      body: SizedBox(
        height:size.height *.9,
        child: ListView.builder(
            itemCount: sampleData.length,
            padding: EdgeInsets.only(left: 8.0, right: 8),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => BusinessCardItemHorizontal(item: sampleData[index])
        ),
      ),
    );
  }
}
