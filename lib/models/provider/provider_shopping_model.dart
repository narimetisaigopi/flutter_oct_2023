class ProviderShoppingModel {
  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  Rating rating = Rating();

  ProviderShoppingModel({
    this.id = 0,
    this.title = "",
    this.price = 0.0,
    this.description = "",
    this.category = "",
    this.image = "",
  });

  fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    price =
        json['price'] != null ? double.parse(json['price'].toString()) : 0.0;
    description = json['description'] ?? "";
    category = json['category'] ?? "";
    image = json['image'] ?? "";
    rating = json['rating'] != null
        ? Rating.fromJson(json['rating'])
        : Rating.fromJson({});
  }
}

class Rating {
  late double rate;
  late int count;

  Rating({this.rate = 0, this.count = 0});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] != null ? double.parse(json['rate'].toString()) : 0.0;
    count = json['count'] ?? 0;
  }
}
