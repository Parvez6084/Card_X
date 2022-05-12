import 'package:card_x/consts/app_const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../model/contact_model.dart';
import '../../../services/remote_service.dart';



class CardListPageController extends GetxController{
  var isListModeView = false.obs;
  final box = GetStorage();
  var contactList= <ContactModel>[].obs;
  bool get isListMode => box.read(AppConst.IS_LIST_MODE) ?? false;

  void listModeUpdate(bool val) {
    box.write(AppConst.IS_LIST_MODE, val);
  }

}