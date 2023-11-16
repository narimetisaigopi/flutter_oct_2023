import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_telugu/models/product_model.dart';
import 'package:flutter_telugu/utils/utils.dart';
import 'package:http/http.dart' as http;

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String data = "";
  bool isLoading = false;
  List<ProductModel> productsList = [];
  // future, await , async
  getDataUsingCallBack() {
    http.get(Uri.parse("https://dummyjson.com/products"),
        headers: {"token": "sometoken"}).then((value) {
      log(value.statusCode.toString());
      if (value.statusCode == 200) {
        print("Successfully fetched data");
        log(value.body);
        setState(() {});
      } else {
        print("Failed to fetch data");
      }
    }).catchError((onError) {});
    print("getData called after");
  }

  getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      print("getData called before");
      http.Response response =
          await http.get(Uri.parse("https://dummyjson.com/products"));
      print("getData called after");
      log(response.statusCode.toString());

      data = response.body;

      List products = jsonDecode(data)["products"] ?? [];

      log(jsonDecode(data)["total"].toString());

      // for (var item in products) {
      //   productsList.add(ProductModel.fromMap(item));
      // }
      productsList = products.map((e) => ProductModel.fromMap(e)).toList();
      // productsList = (jsonDecode(data)["products"] as List ?? [])
      //     .map((e) => ProductModel.fromMap(e))
      //     .toList();

      log(productsList.length.toString());
    } catch (e, stackTrace) {
      log(stackTrace.toString());
      Utils.showToast("Failed to get data");
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    //getDataUsingCallBack();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      productsList[index].thumbnail,
                      width: 100,
                      height: 100,
                    ),
                    title: Text(productsList[index].title),
                  ),
                );
              }),
    );
  }
}
