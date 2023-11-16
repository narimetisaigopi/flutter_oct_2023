class ProductModel {
  //1. variable initialize
  //2. constructor
  //3. parsing the data
  //4. sending the data (firebase)
  // ***********************************
  // step: 1 variable initialize
  final int id;
  final String title;
  final String thumbnail;
  // step: 2 constructor (should have named parameters with default values)
  ProductModel({this.id = 0, this.title = "", this.thumbnail = ""});
  // step: 3 parsing the data
  factory ProductModel.fromMap(Map map) {
    return ProductModel(
        id: map["id"] ?? 0,
        title: map["title"] ?? "",
        thumbnail: map["thumbnail"] ?? "");
  }
}
