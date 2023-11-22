import 'package:flutter/material.dart';
import 'package:flutter_telugu/models/getx/my_item_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class MyItemsController extends GetxController {
  List<MyItemModel> favouritesList = [];
  addItemToWishList(MyItemModel myItemModel) {
    favouritesList.add(myItemModel);
    update();
    Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        message: "Added to wishlist",
        backgroundColor: Colors.green));
  }

  removeItemFromWishList(MyItemModel myItemModel) {
    favouritesList.removeWhere((element) => element.name == myItemModel.name);
    update();
    Get.showSnackbar(const GetSnackBar(
        title: "Text",
        duration: Duration(seconds: 2),
        message: "Removed from wishlist",
        backgroundColor: Colors.red));
  }

  bool isAddedItem(MyItemModel myItemModel) {
    List list = favouritesList
        .where((element) => element.name == myItemModel.name)
        .toList();
    return list.isEmpty;
  }

  int getWishlistPrice() {
    int price = 0;
    for (var element in favouritesList) {
      price += element.price;
    }
    return price;
  }
}
