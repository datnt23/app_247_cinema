import 'package:app_247_cinema/utils/theme.dart';
import 'package:flutter/material.dart';

import 'components/categoryBar.dart';
import 'components/coming_soon.dart';
import 'components/promo.dart';
import 'components/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor.backGround,
      appBar: AppBar(
        backgroundColor: ThemeColor.headerBackGround,
        elevation: 5,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Center(
          child: Text(
            '247 Cinema'.toUpperCase(),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/image/logo_home_247.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Category 
            CategoryBar(size: size),
            //Title
            buildTitle('Now Playing'),
            //Slider 
            SliderBar(size: size),
            //Title
            buildTitle('Coming Soon'),
            //Coming soon 
            const ComingSoon(),
            //Title
            buildTitle('Promo'),
            //Promo 
            Promo(size: size),
            Promo(size: size),
            Promo(size: size),
          ],
        ),
      ),
    );
  }

  Padding buildTitle(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
      child: Text(
        content,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            height: 1.2,
            decoration: TextDecoration.none,
            color: ThemeColor.black),
      ),
    );
  }
}
