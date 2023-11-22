import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_telugu/models/provider/cart_provider.dart';
import 'package:flutter_telugu/models/provider/provider_shopping_model.dart';
import 'package:flutter_telugu/providers/shops_provider.dart';
import 'package:provider/provider.dart';

import 'cart_provider_list_screen.dart';

class ProviderListScreen extends StatefulWidget {
  const ProviderListScreen({super.key});

  @override
  State<ProviderListScreen> createState() => _ProviderListScreenState();
}

class _ProviderListScreenState extends State<ProviderListScreen> {
  late ShopsProvider shopsProvider;
  late CartProvider cartProvider;
  @override
  void initState() {
    shopsProvider = Provider.of<ShopsProvider>(context, listen: false);
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    shopsProvider.getShoppingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("called build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider example"),
        actions: [
          Consumer<CartProvider>(builder: (context, provider, chil) {
            return IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CartProviderListScreen()));
                },
                icon: Stack(
                  children: [
                    Icon(Icons.shopping_bag),
                    CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                        child: Text(
                          provider.cartList.length.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ))
                  ],
                ));
          })
        ],
      ),
      body: Consumer<ShopsProvider>(builder: (context, shopProvider, child) {
        log("called Consumer");
        //return Text("${shopsProvider.providerShoppingModelList.toString()}");
        return Column(
          children: [
            shopProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : shopsProvider.error.isNotEmpty
                    ? Text(shopsProvider.error)
                    : Expanded(
                        child: ListView.builder(
                            itemCount:
                                shopsProvider.providerShoppingModelList.length,
                            itemBuilder: (context, index) {
                              ProviderShoppingModel providerShoppingModel =
                                  shopsProvider
                                      .providerShoppingModelList[index];
                              return Card(
                                child: ListTile(
                                  leading: Image.network(
                                    providerShoppingModel.image,
                                    width: 100,
                                    height: 100,
                                  ),
                                  title: Text(
                                    providerShoppingModel.title,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  trailing: TextButton(
                                      onPressed: () {
                                        cartProvider
                                            .addToCart(providerShoppingModel);
                                      },
                                      child: const Text("Add to cart")),
                                ),
                              );
                              // return Text("hello");
                            }),
                      ),
          ],
        );
      }),
    );
  }
}
