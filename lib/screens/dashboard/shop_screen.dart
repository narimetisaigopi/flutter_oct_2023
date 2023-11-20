import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

  Future<List<ProductModel>> getFutureData() async {
    List<ProductModel> productsList = [];
    try {
//       GET	/posts/3/comments => Path params
// GET	/comments?postId=1  => Path params
      int a = 1;
      http.Response response =
          await http.get(Uri.parse("https://dummyjson.com/products"));
      if (response.statusCode == 200) {
        String data = response.body;
        List products = jsonDecode(data)["products"] ?? [];
        productsList = products.map((e) => ProductModel.fromMap(e)).toList();
        return productsList;
      } else {
        throw Exception("Data not found, status code is not 200");
      }
    } catch (e, stackTrace) {
      log(stackTrace.toString());
      Utils.showToast("Failed to get data");
      print(e.toString());
      throw Exception(e.toString());
    } finally {
      // ignore: control_flow_in_finally
      // return productsList;
    }
  }

  @override
  void initState() {
    //getDataUsingCallBack();
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: isLoading
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: productsList.length,
      //         itemBuilder: (context, index) {
      // return Card(
      //   child: ListTile(
      //     leading: Image.network(
      //       productsList[index].thumbnail,
      //       width: 100,
      //       height: 100,
      //     ),
      //     title: Text(productsList[index].title),
      //   ),
      // );
      //         }),
      body: FutureBuilder<List<ProductModel>>(
        future: getFutureData(),
        builder: (context, snapshot) {
          // setup 1
          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Text("No Data");
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  ProductModel productModel = snapshot.data![index];
                  return Card(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 150.0,
                              aspectRatio: 16 / 9,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5)),
                          items: productModel.images.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent),
                                    child: Image.network(
                                      i,
                                      fit: BoxFit.fill,
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                        ListTile(
                          leading: Image.network(
                            productModel.thumbnail,
                            width: 100,
                            height: 100,
                          ),
                          title: Text(productModel.title),
                        ),
                      ],
                    ),
                  );
                });
          }
          // setup 2
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
            // return Center(child: Text("Something went wrong."));
          }
          // setup 3
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // body: StreamBuilder(),
    );
  }
}
