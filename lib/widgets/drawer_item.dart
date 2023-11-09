import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function() onTap;
  const DrawerItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
