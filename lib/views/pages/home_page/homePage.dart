import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_x/views/pages/home_page/homePageController.dart';
import 'package:card_x/views/widgets/categoryCard_item.dart';
import 'package:card_x/views/widgets/businessCard_itemHorizontal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_fonts.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/businessCard_item.dart';
import '../../widgets/side_drawer.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome to ',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: AppFonts.yesteryear,
                  fontWeight: FontWeight.w400),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Card-X',
                  textStyle: TextStyle(
                fontSize: 24,
                color: Colors.pink,
                fontFamily: AppFonts.yesteryear,
                fontWeight: FontWeight.w400),
                  speed: const Duration(milliseconds: 500),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Get.toNamed(Routes.searchPage),
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.addCardPage),
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: SideDrawerWidget(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(()=> CarouselSlider(
                  items: controller.contactList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return BusinessCard( item: i);
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 240,
                    initialPage: 0,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    //onPageChanged:,
                    scrollDirection: Axis.horizontal,
                  )),),
              Padding(
                padding: const EdgeInsets.only(top: 8,left: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.w700)),

                new GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.categoryPage);
                  },
                  child: Text('See all',style: TextStyle(fontSize: 16,color: Colors.pink,fontWeight: FontWeight.w400)),
                )
                ],
                )),
              SizedBox(
                height:200,
                child: Obx(()=>  ListView.builder(
                    itemCount: controller.categoryList.length,
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryCard(item: controller.categoryList[index])
                ),)
              ),
              Align(alignment:Alignment.topLeft,child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Cards',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.w700)),
              )),
              SizedBox(
                height:size.height *.7,
                child:Obx(()=> ListView.builder(
                    itemCount: controller.contactList.length,
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => BusinessCardItemHorizontal(item: controller.contactList[index])
                ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}




