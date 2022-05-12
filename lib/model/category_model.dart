
final String tableCategory = 'tbl_category';
final String colCategoryID = 'id';
final String colCategoryName = 'category_name';
final String colItem = 'category_item';

class CategoryModel{
  String? categoryName;

  int? id;

  CategoryModel({this.id, this.categoryName});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colCategoryName: categoryName,
    };
    if (id != null) {
      map[colCategoryID] = id;
    }
    return map;
  }

  CategoryModel.fromMap(Map<String, dynamic> map) {
    id = map[colCategoryID];
    categoryName = map[colCategoryName];
  }

  @override
  String toString() {
    return 'CategoryModel{categoryName: $categoryName,id: $id}';
  }
}