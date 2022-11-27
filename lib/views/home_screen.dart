import 'package:app_247_cinema/controller/auth_controller.dart';
import 'package:app_247_cinema/utils/constants.dart';
import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:app_247_cinema/views/profile_user_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../view/pages/home/components/coming_soon.dart';
import '../view/pages/home/components/promo.dart';
import '../view/pages/home/components/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: ThemeColor.headerBackGround));
    final Size size = MediaQuery.of(context).size;
    String? picUrl = AuthController.instance.getUser!.photoURL;
    picUrl = picUrl ?? Constants.demoAvatar;
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
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                Get.to(const ProfileUser());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  imageUrl: picUrl,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            buildTitle('Đang Chiếu'),
            //Slider 
            SliderBar(size: size),
            //Title
            buildTitle('Sắp Chiếu'),
            //Coming soon 
            const ComingSoon(),
            //Title
            buildTitle('Sự Kiện'),
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
