import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/details_page.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/CartScreen";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int currentIndex = 0;

  List programmingImagesList = [
    "https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ",
    "https://i.pinimg.com/564x/38/4d/1e/384d1e8c3c8dcfee10ab0b980f8075cd.jpg",
    "https://miro.medium.com/v2/resize:fit:300/1*RmhCkNR30Ecf6xox3GrOlw.png",
    "https://www.finoit.com/wp-content/uploads/2022/09/clean-code-java-principles.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: programmingImagesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 3),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => DetailsPage(
                              imageUrl: programmingImagesList[index],
                              title: "",
                              description: "",
                            )));
              },
              child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(8),
                  child: Image.network(programmingImagesList[index])),
            );
          }),
    );
  }
}
