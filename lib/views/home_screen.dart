import 'package:app_247_cinema/controller/auth_controller.dart';
import 'package:app_247_cinema/utils/constants.dart';
import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:app_247_cinema/views/home/banner_widget.dart';
import 'package:app_247_cinema/views/home/view_all_title_widget.dart';
import 'package:app_247_cinema/views/pages/nav_bar.dart';
import 'package:app_247_cinema/views/user/membership_user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../view/pages/home/components/coming_soon.dart';
import '../view/pages/home/components/promo.dart';
import 'home/sliderBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ThemeColor.headerBackGround));
    final Size size = MediaQuery.of(context).size;
    String? picUrl = AuthController.instance.getUser!.photoURL;
    picUrl = picUrl ?? Constants.demoAvatar;
    return Scaffold(
      backgroundColor: ThemeColor.backGround,
      endDrawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: ThemeColor.headerBackGround,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            height: 10,
            width: 10,
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
        ),
        title: Center(
          child: Text(
            '247 Cinema'.toUpperCase(),
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BannerWidget(),
            //Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
              child: ViewAllTitleWidget(title: "Đang Chiếu"),
            ),
            //Slider
            SliderBar(size: size),
            //Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
              child: ViewAllTitleWidget(title: "Sắp Chiếu"),
            ),
            //Coming soon
            const ComingSoon(),
            //Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
              child: ViewAllTitleWidget(title: "Sự Kiện"),
            ),
            //Promo
            Promo(size: size),
            Promo(size: size),
            Promo(size: size),
          ],
        ),
      ),
    );
  }
}
