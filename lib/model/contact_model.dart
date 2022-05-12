final String tableContact = 'tbl_contact';
final String colContactID = 'id';
final String colCategoryId = 'category_id';
final String colName = 'contract_name';
final String colDesignation = 'contract_designation';
final String colPhone = 'contract_phone';
final String colEmail = 'contract_Email';
final String colWebSite = 'contract_website';
final String colCompanyName = 'contract_company_name';
final String colAddress = 'contract_address';
final String colImage = 'contract_image';
final String colFavorite = 'contract_favorite';


class ContactModel {
  int? id;
  int? categoryId;
  String? imagePath;
  String? fullName;
  String? designation;
  String? phoneNumber;
  String? email;
  String? companyName;
  String? address;
  String? webSite;
  bool? isFavorite;

  ContactModel(
      {this.id,
      this.categoryId,
      this.imagePath = 'N/A',
      required this.fullName,
      this.designation = 'Unknown',
      required this.phoneNumber,
      this.email = 'N/A',
      this.companyName = 'Unknown',
      this.webSite = 'N/A',
      required this.address,
      this.isFavorite = false});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colCategoryId: categoryId,
      colName: fullName,
      colDesignation: designation,
      colPhone: phoneNumber,
      colEmail: email,
      colCompanyName: companyName,
      colWebSite: webSite,
      colAddress: address,
      colImage: imagePath,
      colFavorite: isFavorite! ? 1 : 0,
    };
    if (id != null) {
      map[colContactID] = id;
    }
    return map;
  }

  ContactModel.fromMap(Map<String, dynamic> map) {
    id = map[colContactID];
    categoryId = map[colCategoryId];
    fullName = map[colName];
    designation = map[colDesignation];
    phoneNumber = map[colPhone];
    email = map[colEmail];
    companyName = map[colCompanyName];
    webSite = map[colWebSite];
    address = map[colAddress];
    imagePath = map[colImage];
    isFavorite = map[colFavorite] == 1 ? true : false;
  }

  String toQRText() {
    return 'fullName: $fullName\n designation: $designation\n phoneNumber: $phoneNumber\n email: $email\n webSite: $webSite\n companyName: $companyName\n address: $address';
  }

  @override
  String toString() {
    return 'CardModel{id: $id, categoryId: $categoryId, imagePath: $imagePath, fullName: $fullName, designation: $designation, phoneNumber: $phoneNumber, email: $email, companyName: $companyName, address: $address, webSite: $webSite, isFavorite: $isFavorite}';
  }
}
