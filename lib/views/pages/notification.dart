import 'package:flutter/material.dart';

import '../../utils/theme_colors.dart';
import 'nav_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.headerBackGround,
        title: const Text(
          "Thông Báo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ThemeColor.white,
          ),
        ),
        elevation: 0,
      ),
      endDrawer: const NavBar(),
    );
  }
}