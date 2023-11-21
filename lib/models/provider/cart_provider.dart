import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_telugu/models/provider/provider_shopping_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProviderShoppingModel> cartList = [];
  addToCart(ProviderShoppingModel shoppingModel) {
    cartList.add(shoppingModel);
    log("cartList ${cartList.length}");
    notifyListeners();
  }

  removeFromCart(ProviderShoppingModel shoppingModel) {
    cartList.removeWhere((element) => element.id == shoppingModel.id);
    notifyListeners();
  }
}
