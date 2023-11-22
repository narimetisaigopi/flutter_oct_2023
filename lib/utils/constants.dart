import 'package:flutter/material.dart';
import 'package:flutter_telugu/models/getx/my_item_model.dart';

class Constants {
  static const Color appBarColor = Color(0xff34cfeb);

  static const Map<String, dynamic> coursesMap = {
    "products": [
      {"name": "Dart", "price": 4999},
      {"name": "JS", "price": 10999},
      {"name": "TS", "price": 3500},
      {"name": "Flutter", "price": 29860},
      {"name": "Node Js", "price": 14999},
    ]
  };
  static List<MyItemModel> coursesMapModelList = [
    MyItemModel(name: "Dart", price: 4999),
    MyItemModel(name: "JS", price: 10999),
    MyItemModel(name: "TS", price: 3500),
    MyItemModel(name: "Flutter", price: 29860),
    MyItemModel(name: "Node Js", price: 14999),
  ];
}
