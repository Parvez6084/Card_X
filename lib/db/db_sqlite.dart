import 'dart:io';

import 'package:card_x/model/category_model.dart';
import 'package:card_x/model/contact_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:convert' as convert;

class DBSQLite extends GetxService {
  DBSQLite._internal();

  static final DBSQLite dbSqLite = DBSQLite._internal();

  static Database? _database;

  Future<Database> get database async => _database ??= await _open();

/*
  select count(tbl_category.id) as totalCard, tbl_category.id, tbl_category.category_name from tbl_category
  inner join tbl_contact on tbl_category.id = tbl_contact.category_id
  group by tbl_category.id, tbl_category.category_name;


  select * from tbl_contact WHERE category_id = 7*/

  final String _createCategoryTable = '''CREATE TABLE $tableCategory(
  $colCategoryID integer primary key autoincrement,
  $colCategoryName text not null)''';

  final String _createContactTable = '''CREATE TABLE $tableContact(
  $colContactID integer primary key autoincrement,
  $colName text not null,
  $colDesignation text not null,
  $colPhone text not null,
  $colEmail text not null,
  $colWebSite text not null,
  $colCompanyName text not null,
  $colAddress text not null,
  $colImage text not null,
  $colCategoryId integer not null default 0,
  $colFavorite integer not null default 0
  )''';

  Future<Database> _open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'card_x.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(_createCategoryTable);
      await db.execute(_createContactTable);
    });
  }

  // DataBase dynamic ...........

  static Future<int> insertItems(
      String tableName, Map<String, dynamic> toMap) async {
    final db = await dbSqLite.database;
    return db.insert(tableName, toMap);
  }

  static Future<int> updateCategoryByID(
      String tableName, String columnName, int id, String value) async {
    final db = await dbSqLite.database;
    return db.update(tableName, {columnName: value},
        where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateFavorite(int id, int value) async {
    final db = await dbSqLite.database;
    return db.update(tableContact, {colFavorite: value},
        where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> deleteItemByID(String tableName, int id) async {
    final db = await dbSqLite.database;
    return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  // DB Query..............

  Future<List<CategoryModel>> getAllCategory() async {
    final db = await dbSqLite.database;
    final mapList = await db.query(tableCategory);
    return List.generate(
        mapList.length, (index) => CategoryModel.fromMap(mapList[index]));
  }

  Future<List<ContactModel>> fetchAllContract() async {
    final db = await dbSqLite.database;
    final mapList = await db.query(tableContact);
    return List.generate(
        mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }

  //select * from tbl_contact WHERE category_id = 7
  Future<List<ContactModel>> fetchContractByCategoryId(int id) async {
    final db = await dbSqLite.database;
    final mapList = await db
        .query(tableContact, where: '$colCategoryId = ?', whereArgs: [id]);
    return List.generate(
        mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }

  static Future<List<ContactModel>> searchValue(String text) async {
    final db = await dbSqLite.database;
    final mapList = await db.rawQuery(
        "SELECT * FROM tbl_contact WHERE contract_name LIKE '%${text}%' OR  contract_phone LIKE '%${text}%' OR  contract_company_name LIKE '%${text}%' OR  contract_address LIKE '%${text}%'");
    return List.generate(
        mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }

  /*  Future<ContactModel> getContractByID(int id) async {
    final db = await dbSqLite.database;
    final mapList =
    await db.query(tableContact, where: 'id = ?', whereArgs: [id]);
    return ContactModel.fromMap(mapList.first);
  }
   Future<List<ContactModel>> getFavoriteContractByID(int id) async {
    final db = await dbSqLite.database;
    final mapList =
    await db.query(tableContact, where: '$colFavorite = ?', whereArgs: [1]);
    return List.generate(
        mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }*/

  List<String> tables = [];
  static const SECRET_KEY = "CardX_PRIVATE_KEY_ENCRYPT_2022";

  Future<String> generateBackup({bool isEncrypted = true}) async {
    print('GENERATE BACKUP');
    var dbs = await dbSqLite.database;
    List data = [];
    List<Map<String, dynamic>> listMaps = [];

    for (var i = 0; i < tables.length; i++) {
      listMaps = await dbs.query(tables[i]);
      data.add(listMaps);
    }

    List backups = [tables, data];
    String json = convert.jsonEncode(backups);

    if (isEncrypted) {
      var key = encrypt.Key.fromUtf8(SECRET_KEY);
      var iv = encrypt.IV.fromLength(16);
      var encrypter = encrypt.Encrypter(encrypt.AES(key));
      var encrypted = encrypter.encrypt(json, iv: iv);
      return encrypted.base64;
    } else {
      return json;
    }
  }

  Future<void> restoreBackup(String backup, {bool isEncrypted = true}) async {
    var dbs = await dbSqLite.database;
    Batch batch = dbs.batch();
    var key = encrypt.Key.fromUtf8(SECRET_KEY);
    var iv = encrypt.IV.fromLength(16);
    var encrypter = encrypt.Encrypter(encrypt.AES(key));

    List json = convert
        .jsonDecode(isEncrypted ? encrypter.decrypt64(backup, iv: iv) : backup);

    for (var i = 0; i < json[0].length; i++) {
      for (var k = 0; k < json[1][i].length; k++) {
        batch.insert(json[0][i], json[1][i][k]);
      }
    }
    await batch.commit(continueOnError: false, noResult: true);
    print('RESTORE BACKUP');
  }
}
