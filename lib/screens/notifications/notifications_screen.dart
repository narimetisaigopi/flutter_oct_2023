import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      print("addListener ${tabController.index}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Notifications"),
            bottom: TabBar(
                isScrollable: false,
                controller: tabController,
                onTap: (index) {
                  print("tab tapped $index");
                },
                tabs: [
                  Tab(
                    text: "Primary",
                    icon: Icon(Icons.stay_primary_landscape),
                  ),
                  Tab(
                    text: "General",
                  ),
                  Tab(
                    text: "Requests",
                    icon: Icon(Icons.generating_tokens),
                  ),
                ]),
          ),
          body: TabBarView(controller: tabController, children: [
            Center(child: Text("Primary")),
            Center(child: Text("General")),
            Center(child: Text("Requests")),
          ]),
        ));
  }
}
