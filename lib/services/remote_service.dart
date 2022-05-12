import 'package:get/get.dart';

import '../db/db_sqlite.dart';
import '../model/category_model.dart';
import '../model/contact_model.dart';

class RemoteService extends GetxService {
  static Future<List<CategoryModel>> fetchAllCategoryByDB() async {
    var categoryByDB = <CategoryModel>[].obs;
    await DBSQLite.dbSqLite.getAllCategory().then((value) {
      categoryByDB.addAll(value);
    }).onError((error, stackTrace) {
      return null;
    });
    return categoryByDB;
  }

  static Future<List<ContactModel>> fetchAllContactByDB() async {
    var contactByDB = <ContactModel>[].obs;
    await DBSQLite.dbSqLite.fetchAllContract().then((value) {
      contactByDB.addAll(value);
    }).onError((error, stackTrace) {
      return null;
    });
    return contactByDB;
  }

  static Future<List<ContactModel>> fetchContactByCategoryID(int id) async {
    var contactByDB = <ContactModel>[].obs;
    await DBSQLite.dbSqLite.fetchContractByCategoryId(id).then((value) {
      contactByDB.addAll(value);
    }).onError((error, stackTrace) {
      return null;
    });
    return contactByDB;
  }

}
