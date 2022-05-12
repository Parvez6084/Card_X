import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPageController extends GetxController {
  void launchURL(String value) async {
    if (!await launch(value)) throw 'Could not launch $value';
  }
}


