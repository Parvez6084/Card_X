import 'dart:math';

import 'package:card_x/model/contact_model.dart';
import 'package:card_x/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../utils/utils.dart';

class BusinessCard extends GetView {
  final ContactModel item;
  const BusinessCard({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){Get.toNamed(Routes.detailsPage, arguments: item);},
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 220,
        width: size.width * .9,
        decoration: BoxDecoration(
           image: DecorationImage(
                image:AssetImage( 1==2?
                    Utils.randomImage[Random().nextInt(11)]
                        : Utils.gradientImage[Random().nextInt(5)]),
                fit: BoxFit.fill
            ),
          /*   gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.9],
            colors: Utils.gradientColors[Random().nextInt(9)]
          ),*/
         // color: Utils.solidColors[Random().nextInt(11)],
          borderRadius: const BorderRadius.all(Radius.circular(16),),
        ),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Stack(
            children: [
              Positioned(top: 0,left: 0, child: Text(item.fullName!,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700))),
              Positioned(top: 24,left: 0,child: Text(item.designation!,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400))),
              Positioned(
                top: 50,
                left: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone,color: Colors.white,size: 14,),
                        SizedBox(width: 8,),
                        Text('+88 '+item.phoneNumber!,style: TextStyle(fontSize: 14,color: Colors.white,letterSpacing: 2)),],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email,color: Colors.white,size: 14,),
                        SizedBox(width: 8,),
                        Text(item.email!,style: TextStyle(fontSize: 14,color: Colors.white)),],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(item.companyName!,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700)),
                        Container(color: Colors.white,height: 2,width: 200,),],
                    ),
                    Text(item.webSite!,style: TextStyle(fontSize: 14,color: Colors.white)),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width:220, child: Text(item.address!,textAlign: TextAlign.justify,style: TextStyle(fontSize: 12,color: Colors.white))),],
                    ),
                  ],
                ),
              ),
              Positioned( bottom:0, left: 0,child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite, size: 32,color: Colors.white,))),
              Positioned(top:0,right:0,child:
              Container(
                  decoration:BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(8)),border: Border.all(color: Colors.white,width: 2)),
                  child: QrImage(
                data: item.toQRText(),
                version: QrVersions.auto,
                foregroundColor: Colors.white,
                size: 60,
                gapless: false,
              )))
            ],
          ),
        ),
      ),
    );
  }
}