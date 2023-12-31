import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_telugu/models/provider/provider_shopping_model.dart';
import 'package:flutter_telugu/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class ShopsProvider extends ChangeNotifier {
  List<ProviderShoppingModel> providerShoppingModelList = [];
  List<ProviderShoppingModel> filteredProviderShoppingModelList = [];
  bool isLoading = false;
  String error = "";
  getShoppingData() async {
    try {
      isLoading = true;
      error = "";
      notifyListeners();
      filteredProviderShoppingModelList.clear();
      providerShoppingModelList.clear();
      http.Response response =
          await http.get(Uri.parse(ApiConstants.shoppingProducts));
      log("getShoppingData ${response.body}");
      if (response.statusCode == 200) {
        // data received
        providerShoppingModelList =
            (jsonDecode(response.body) as List).map((e) {
          ProviderShoppingModel providerShoppingModel = ProviderShoppingModel();
          providerShoppingModel.fromJson(e);
          print("providerShoppingModel ${providerShoppingModel.title}");
          return providerShoppingModel;
        }).toList();
        filteredProviderShoppingModelList.addAll(providerShoppingModelList);
        // var list = (jsonDecode(response.body) as List);
        // for (var element in list) {
        //   print(element);
        //   ProviderShoppingModel shoppingModel = ProviderShoppingModel();
        //   shoppingModel.title = element["title"];
        //   providerShoppingModelList.add(shoppingModel);
        // }
      } else {
        // something went wrong
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
    log("providerShoppingModelList ${providerShoppingModelList.length}");
  }

  searchProdcuts(String searchItem) async {
    await Future.delayed(const Duration(milliseconds: 300));
    filteredProviderShoppingModelList = providerShoppingModelList
        .where((element) =>
            element.title.toLowerCase().contains(searchItem.toLowerCase()) ||
            element.description
                .toLowerCase()
                .contains(searchItem.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
