import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/details_page.dart';
import 'package:flutter_telugu/widgets/home_news_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List programmingNamesList = ["Dart", "JS", "TS", "Java"];
  List programmingImagesList = [
    "https://play-lh.googleusercontent.com/qbeCduZblOk80GaY164lw47gIRjXq9QIzSmgFwqQj1PyhNhTWxYR0OqPzm8BumnmJQ",
    "https://i.pinimg.com/564x/38/4d/1e/384d1e8c3c8dcfee10ab0b980f8075cd.jpg",
    "https://miro.medium.com/v2/resize:fit:300/1*RmhCkNR30Ecf6xox3GrOlw.png",
    "https://www.finoit.com/wp-content/uploads/2022/09/clean-code-java-principles.jpg",
  ];
  List programmingDescriptionList = [
    "Dart is a programming language designed by Lars Bak and Kasper Lund and developed by Google. It can be used to develop web and mobile apps as well as server and desktop applications. Dart is an object-oriented, class-based, garbage-collected language with C-style syntax.",
    "JavaScript, often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS. As of 2023, 98.7% of websites use JavaScript on the client side for webpage behavior, often incorporating third-party libraries",
    "TS",
    "Java"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: HomeNewsItem(
      //   imageUrl: programmingImagesList[3],
      //   title: programmingNamesList[3],
      //   description: programmingDescriptionList[3],
      // ),
      body: ListView.builder(
          itemCount: programmingNamesList.length,
          itemBuilder: (context, index) {
            return HomeNewsItem(
              imageUrl: programmingImagesList[index],
              title: programmingNamesList[index],
              description: programmingDescriptionList[index],
            );
          }),
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     Container(
      //       height: 200,
      //       width: double.infinity,
      //       color: Colors.green,
      //     ),
      //     Container(
      //       height: 200,
      //       width: double.infinity,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 200,
      //       width: double.infinity,
      //       color: Colors.white,
      //     ),
      //     Container(
      //       height: 200,
      //       width: double.infinity,
      //       color: Colors.amber,
      //     ),
      //   ],
      // ),
    );
  }
}
