import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/auth/registration_screen.dart';
import 'package:flutter_telugu/screens/dashboard/cart_screen.dart';
import 'package:flutter_telugu/screens/dashboard/home_screen.dart';
import 'package:flutter_telugu/screens/dashboard/profile_screen.dart';
import 'package:flutter_telugu/utils/utils.dart';
import 'package:flutter_telugu/widgets/drawer_item.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/DashboardScreen";
  final String email;
  const DashboardScreen({super.key, required this.email});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List screensList = const [HomeScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Screen"),
        // actions: const [
        //   Icon(Icons.settings),
        //   SizedBox(
        //     width: 10,
        //   )
        // ],
      ),
      drawer: Drawer(
        // width: 200,
        backgroundColor: Colors.grey[80],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(),
                          SizedBox(
                            height: 20,
                          ),
                          Text("saigopi@gmail.com")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Sai")
                    ],
                  )),
            ),
            DrawerItem(
              title: "Reviews",
              iconData: Icons.reviews,
              onTap: () {
                Utils.showToast("Clicked on reviews");
              },
            ),
            DrawerItem(
              title: "Profile",
              iconData: Icons.supervised_user_circle,
              onTap: () {
                Utils.showToast("Clicked on Profile");
              },
            ),
            DrawerItem(
              title: "My Orders",
              iconData: Icons.transcribe,
              onTap: () {
                Utils.showToast("Clicked on my orders");
              },
            ),
            DrawerItem(
              title: "Sign Up",
              iconData: Icons.transcribe,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const RegistrationScreen()));
                Utils.showToast("Clicked on RegistrationScreen");
              },
            ),
          ],
        ),
      ),
      body: screensList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_sharp), label: "Profile"),
        ],
      ),
    );
  }

  // Widget drawerItem(String title, IconData iconData) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           children: [
  //             Icon(
  //               iconData,
  //               color: Colors.green,
  //             ),
  //             const SizedBox(
  //               width: 8,
  //             ),
  //             Text(
  //               title,
  //               style: const TextStyle(color: Colors.black),
  //             )
  //           ],
  //         ),
  //       ),
  //       const Divider()
  //     ],
  //   );
  // }
}
