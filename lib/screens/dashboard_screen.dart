import 'package:flutter/material.dart';
import 'package:flutter_telugu/main.dart';
import 'package:flutter_telugu/screens/auth/login_screen.dart';
import 'package:flutter_telugu/screens/auth/registration_screen.dart';
import 'package:flutter_telugu/screens/dashboard/cart_screen.dart';
import 'package:flutter_telugu/screens/dashboard/home_screen.dart';
import 'package:flutter_telugu/screens/dashboard/profile_screen.dart';
import 'package:flutter_telugu/screens/dashboard/shop_screen.dart';
import 'package:flutter_telugu/screens/notifications/notifications_screen.dart';
import 'package:flutter_telugu/screens/provider/provider_list_screen.dart';
import 'package:flutter_telugu/screens/settings/profile_settings.dart';
import 'package:flutter_telugu/screens/slide_show_screen.dart';
import 'package:flutter_telugu/screens/splash_screen.dart';
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

  List screensList = const [
    HomeScreen(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (builder) {
              return AlertDialog(
                // title: const Text("Exit"),
                // content: Text("Do you want to logout?"),
                content: Container(
                  height: 50,
                  child: const Column(
                    children: [
                      Text("Do you want to exit from app?"),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
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
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard Screen"),
          actions: [
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text("Filter one"),
                              Text("Filter Two"),
                              Text("Filter Three"),
                            ],
                          ),
                        );
                      });
                },
                child: Icon(Icons.filter_alt)),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => SlideShowScreen()));
                },
                child: Icon(Icons.slideshow_outlined)),
            SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => NotificationsScreen()));
                },
                child: Icon(Icons.notifications)),
          ],
        ),
        drawer: Drawer(
          // width: 200,
          backgroundColor: Colors.grey[80],
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: DrawerHeader(
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
                            Column(
                              children: [
                                Text(
                                    sharedPreferences.getString("email") ?? ""),
                                Text(sharedPreferences.getString("password") ??
                                    "")
                              ],
                            ),
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
                title: "Provider Example",
                iconData: Icons.supervised_user_circle,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const ProviderListScreen()));
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
                title: "Profile Settings",
                iconData: Icons.transcribe,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ProfileSettings()));
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
              DrawerItem(
                title: "Sign Out",
                iconData: Icons.transcribe,
                onTap: () async {
                  Navigator.pop(context);
                  await sharedPreferences.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                      (route) => false);
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
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_sharp), label: "Profile"),
          ],
        ),
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
