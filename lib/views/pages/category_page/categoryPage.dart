import 'package:card_x/db/db_sqlite.dart';
import 'package:card_x/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../consts/app_fonts.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/categoryCard_itemHorizontal.dart';
import 'categoryPageController.dart';

class CategoryPage extends GetView<CategoryPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Category Page',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: AppFonts.yesteryear,
              fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.addCategoryPage);
            },
            icon: Icon(Icons.add, color: Colors.black),
          )
        ],
      ),
      body: FutureBuilder<List<CategoryModel>>(
        future: DBSQLite.dbSqLite.getAllCategory(),
        builder: (context, snapshot){
           if (snapshot.hasData) {
            var data = snapshot.data!;
           return SizedBox(
             height: size.height * .9,
             child:  GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2),
               itemBuilder: (_, index) => CategoryCardItemHorizontal(
                   item:  data[index]),
               itemCount:  data.length,));
           }
           if (snapshot.hasError) {
             return Text('Fail to face data');
           }
           return Center(
             child: Text('Ops!!\nNo Data Found',
               textAlign: TextAlign.center,
               style: TextStyle(
                   fontWeight: FontWeight.w600,
                   fontFamily: AppFonts.yesteryear,
                   fontSize: 32),
             ),
           );
        },
      ),
    );
  }
}
