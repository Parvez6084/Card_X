
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_x/consts/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../consts/app_fonts.dart';
import '../../../routes/app_routes.dart';
import 'welcomePageController.dart';

class WelcomePage extends GetView<WelcomePageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: 40,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontFamily: AppFonts.yesteryear,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Card-X',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.pink,
                          fontFamily: AppFonts.yesteryear,
                          fontWeight: FontWeight.w400),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Save business card smartly !!',
                          textStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                          speed: const Duration(milliseconds: 500),
                        ),
                      ],
                      totalRepeatCount: 1,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                  child: Image.asset(AppImages.welcomeImage,fit: BoxFit.cover,width: 300,)),
              Obx(()=> controller.data.isNotEmpty ?
              Positioned(
                bottom: 80,
                left: 40,
                right: 40,
                child: TextButton(
                  child: Text(
                    'Let ready to add >>',
                    style: TextStyle(color: Colors.pink),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.addCardPage);
                  },
                ),
              ) :
              Positioned(
                  bottom: 80,
                  left: 0,right: 0,
                  child: Align(alignment:Alignment.center,child: CircularProgressIndicator())),),
              Align(
                alignment: Alignment.bottomCenter,
                child:Text(
                  'copyright by © 2022 | Parvez Ahmed',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
