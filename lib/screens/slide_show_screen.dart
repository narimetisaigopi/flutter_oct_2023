import 'package:flutter/material.dart';

class SlideShowScreen extends StatefulWidget {
  const SlideShowScreen({super.key});

  @override
  State<SlideShowScreen> createState() => _SlideShowScreenState();
}

class _SlideShowScreenState extends State<SlideShowScreen> {
  late PageController pageController;
  List programmingImagesList = [
    "https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ",
    "https://i.pinimg.com/564x/38/4d/1e/384d1e8c3c8dcfee10ab0b980f8075cd.jpg",
    "https://miro.medium.com/v2/resize:fit:300/1*RmhCkNR30Ecf6xox3GrOlw.png",
    "https://www.finoit.com/wp-content/uploads/2022/09/clean-code-java-principles.jpg",
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    print(MediaQuery.of(context).orientation);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        pageController.nextPage(
            duration: const Duration(seconds: 2), curve: Curves.easeInOutQuad);
      }),
      // body: PageView(
      //   controller: pageController,
      //   scrollDirection: Axis.vertical,
      //   onPageChanged: (value) {
      //     print("page changed to $value");
      //   },
      //   children: [
      //     Container(
      //       color: Colors.green,
      //     ),
      //     Container(
      //       color: Colors.orange,
      //     ),
      //     Container(
      //       color: Colors.purple,
      //     )
      //   ],
      // )
      body: Column(
        children: [
          Container(
            height: size.height * 0.5,
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {},
                itemCount: programmingImagesList.length,
                itemBuilder: (context, index) {
                  return Image.network(programmingImagesList[index]);
                }),
          ),
          
          Placeholder()
        ],
      ),
    );
  }
}
