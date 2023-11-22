import 'package:flutter/material.dart';
import 'package:flutter_telugu/controllers/getx/my_items_controller.dart';
import 'package:flutter_telugu/models/getx/my_item_model.dart';
import 'package:flutter_telugu/utils/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class MyGetxScreen extends StatefulWidget {
  const MyGetxScreen({super.key});

  @override
  State<MyGetxScreen> createState() => _MyGetxScreenState();
}

class _MyGetxScreenState extends State<MyGetxScreen> {
  MyItemsController myItemsController = Get.put(MyItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My GetxScreen"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Get.showSnackbar(GetSnackBar(
                  message: "Hello",
                ));
              },
              child: Text("Show Snakbar")),
          TextButton(
              onPressed: () {
                if (!Get.isDarkMode) {
                  Get.changeTheme(ThemeData.dark());
                } else {
                  Get.changeTheme(ThemeData.light());
                }
              },
              child: const Text("Change theme")),
          GetBuilder<MyItemsController>(builder: (myItemsController) {
            return Column(
              children: [
                Text(
                    "Wish lisrt count: ${myItemsController.favouritesList.length}"),
                Text(
                  "\$${myItemsController.getWishlistPrice()}",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: Constants.coursesMapModelList.length,
                    itemBuilder: (context, index) {
                      MyItemModel model = Constants.coursesMapModelList[index];
                      return Card(
                        child: ListTile(
                          title: Text(model.name),
                          subtitle: Text("\$${model.price.toString()}"),
                          trailing: InkWell(
                              onTap: () {
                                if (myItemsController.isAddedItem(model)) {
                                  myItemsController.addItemToWishList(model);
                                } else {
                                  myItemsController
                                      .removeItemFromWishList(model);
                                }
                              },
                              child: Icon(
                                Icons.favorite,
                                color: !myItemsController.isAddedItem(model)
                                    ? Colors.red
                                    : Colors.black,
                              )),
                        ),
                      );
                    }),
              ],
            );
          })
        ],
      ),
    );
  }
}
