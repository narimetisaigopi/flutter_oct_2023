import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/slide_show_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/ProfileScreen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     // 1 to 10
            //     // 1 to 100
            //     // 1 to 1000
            //     Expanded(
            //       flex: 7,
            //       child: Container(
            //         color: Colors.green,
            //         width: double.infinity,
            //         height: 100,
            //       ),
            //     ),
            //     Expanded(
            //       flex: 3,
            //       child: Container(
            //         color: Colors.yellow,
            //         width: double.infinity,
            //         height: 100,
            //       ),
            //     ),
            //   ],
            // ),
            // flexiable child widget space yantha anthy,
            // expanded parent widget space motham widget
            Container(color: Colors.amber, child: Text("Hello world")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 34,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                        ),
                        Text("@flutterdev"),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 22, child: item("Following", "123", Icons.add)),
                  Expanded(
                      flex: 22,
                      child: item("Followers", "1232", Icons.verified_user)),
                  Expanded(
                      flex: 22, child: item("Bookmarks", "03", Icons.favorite)),
                ],
              ),
            ),
            const Text("Profile Screen"),
            IgnorePointer(

              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Logout"),
                            // content: Text("Do you want to logout?"),
                            content: Container(
                              height: 50,
                              child: const Column(
                                children: [
                                  Text("Do you want to logout?"),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                SlideShowScreen()));
                                  },
                                  child: const Text("Yes")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No")),
                            ],
                          );
                        });
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget item(String title, String count, IconData iconData) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Expanded(flex: 4, child: Icon(iconData)),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Text(title),
                Text(count),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
