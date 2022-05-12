import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

import '../../../routes/app_routes.dart';
import '../../dialogs/custom_snackBar.dart';

class ScanPageController extends GetxController {
  String? path;
  final imagePath = Rxn<String>();
  var imageSource;
  var scanDone = false.obs;

  void scanImage(BuildContext context) async {
    XFile? file = await ImagePicker().pickImage(source: imageSource);
    path = file?.path;

    if (path != null) {
      imagePath.value = path!;
      print('path --> $path');
      final inputImage = InputImage.fromFilePath(path!);
      final textDetector = GoogleMlKit.vision.textDetector();
      final RecognisedText recognisedText =
          await textDetector.processImage(inputImage);

      var tempData = <String>[];
      for (var block in recognisedText.blocks) {
        for (var line in block.lines) {
          tempData.add(line.text);
        }
      }
      print('tost --> $tempData');
      if (tempData.isNotEmpty) {
        scanDone.value = true;
        _onLoading(context, tempData);
      } else {
        scanDone.value = false;
        toastFailSnackBar(context);
      }
    }
  }

  @override
  void onInit() {
    imageSource = ImageSource.camera;
    super.onInit();
  }

  void toastFailSnackBar(BuildContext context) {
    CustomSnackBar.toastSnackBar(
      context: context,
      colors: Colors.pinkAccent,
      title: 'Failed',
      body: 'Scanning failed. Try again',
      iconData: Icons.warning_amber_rounded,
    );
  }

  void _onLoading(BuildContext context, var tempData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.pinkAccent.withOpacity(.7),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(width: 24),
                  new Text(
                    'Please wait...',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    if (scanDone.isTrue)
      new Future.delayed(new Duration(seconds: 3), () {
        scanDone.value = false;
        Navigator.pop(context);
        Get.toNamed(Routes.detailsEditPage,
            arguments: [imagePath.value, tempData]);
      });
  }

  Future<void> backupToStore() async {
    final dbFolder = await getDatabasesPath();
    File source1 = File('$dbFolder/doggie_database.db');

    Directory copyTo = Directory("storage/emulated/0/Sqlite Backup");
    if ((await copyTo.exists())) {
      // print("Path exist");

      var store = await Permission.storage.status;
      var media = await Permission.accessMediaLocation;
      var extraMedia = await Permission.manageExternalStorage;

      if (!store.isGranted ) {
        await Permission.storage.request();
        await Permission.accessMediaLocation.request();
        await Permission.manageExternalStorage.request();
      }
    } else {
      print("not exist");
      if (await Permission.storage.request().isGranted) {
         await copyTo.create();
      } else {
        print('Please give permission');
      }
    }

    String newPath = "${copyTo.path}/doggie_database.db";
    await source1.copy(newPath);
  }

  Future<void> restoreToStore() async {
    var databasesPath = await getDatabasesPath();
    var dbPath = join(databasesPath, 'doggie_database.db');

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File source = File(result.files.single.path!);
      await source.copy(dbPath);
    } else {
      // User canceled the picker

    }
  }
}
