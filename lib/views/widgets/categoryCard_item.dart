import 'dart:math';

import 'package:card_x/model/category_model.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/app_images.dart';
import '../../routes/app_routes.dart';
import '../../utils/utils.dart';

class CategoryCard extends GetView {
  final CategoryModel item;
  const CategoryCard({Key? key,required this.item}) : super(key: key);

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
          colors: Utils.gradientColors[Random().nextInt(9)]
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16),),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.vCard,width: 32,height: 32,color: Colors.white,),
                    Countup(
                      begin: 0,
                      end: 0,
                      duration: Duration(seconds: 3),
                      separator: ',',
                        style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.w700,)
                    )
                  ],
                ),
                Container(color: Colors.white,height: 4,width: 200,),
                Text(item.categoryName!, textAlign:TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}