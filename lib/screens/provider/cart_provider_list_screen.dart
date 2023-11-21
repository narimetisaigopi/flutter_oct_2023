import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_telugu/models/provider/cart_provider.dart';
import 'package:flutter_telugu/models/provider/provider_shopping_model.dart';
import 'package:provider/provider.dart';

class CartProviderListScreen extends StatefulWidget {
  const CartProviderListScreen({super.key});

  @override
  State<CartProviderListScreen> createState() => _CartProviderListScreenState();
}

class _CartProviderListScreenState extends State<CartProviderListScreen> {
  late CartProvider cartProvider;
  @override
  void initState() {
    cartProvider = Provider.of<CartProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("called build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
        log("called Consumer");
        //return Text("${shopsProvider.providerShoppingModelList.toString()}");
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartProvider.cartList.length,
                  itemBuilder: (context, index) {
                    ProviderShoppingModel providerShoppingModel =
                        cartProvider.cartList[index];
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
                          child: Text("Remove"),
                          onPressed: () {
                            cartProvider.removeFromCart(providerShoppingModel);
                          },
                        ),
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
