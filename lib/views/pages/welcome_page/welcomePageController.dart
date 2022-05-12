import 'package:card_x/db/db_sqlite.dart';
import 'package:card_x/model/contact_model.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class WelcomePageController extends GetxController {
  var data = <ContactModel>[].obs;

  @override
  void onInit() {
    getAllContact();
    super.onInit();
  }


  @override
  void onReady() {
    data.isNotEmpty? Get.offNamed(Routes.dashBoardPage): null;
  }

  Future getAllContact() async {
    await DBSQLite.dbSqLite.fetchAllContract().then((value) {
      data.addAll(value);
    }).onError((error, stackTrace) {});
  }



}
