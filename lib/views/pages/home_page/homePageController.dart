import 'package:card_x/model/contact_model.dart';
import 'package:card_x/services/remote_service.dart';
import 'package:get/get.dart';
import '../../../model/category_model.dart';

class HomePageController extends GetxController{
  int btmNavItemIndex = 0;
  var categoryList = <CategoryModel>[].obs;
  var contactList = <ContactModel>[].obs;
  void bottomNavItemTapped(int index){
    btmNavItemIndex = index;
    update();
  }


  @override
  void onInit() {
    fetchAllData();
    super.onInit();
  }

  void fetchAllData() async{
    var category = await RemoteService.fetchAllCategoryByDB();
    var contact = await RemoteService.fetchAllContactByDB();
    if (category.isNotEmpty){
      categoryList.addAll(category);
    }
    if (contact.isNotEmpty){
      contactList.addAll(contact);
    }
  }


}