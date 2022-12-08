import 'package:flutter/material.dart';

import '../../utils/theme_colors.dart';
import 'nav_bar.dart';

class CinemaPage extends StatelessWidget {
  const CinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.headerBackGround,
        title: const Text(
          "Rạp Phim 247",
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