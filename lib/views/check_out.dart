import 'package:app_247_cinema/src/config/app_color.dart';
import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:app_247_cinema/view/pages/selectCinema/components/custom_header.dart';
import 'package:app_247_cinema/view/pages/selectCinema/components/movie_info.dart';
import 'package:app_247_cinema/views/home_screen.dart';
import 'package:app_247_cinema/views/pages/nav_bar.dart';
import 'package:flutter/material.dart';

import '../src/constants/asset_path.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor.backGround,
      appBar: AppBar(
        backgroundColor: ThemeColor.headerBackGround,
        title: const Text(
          "Thanh Toán",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: ThemeColor.white,
          ),
        ),
        elevation: 0,
      ),
      endDrawer: const NavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ThemeColor.black,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width / 2.5,
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      AssetPath.posterOnePiece,
                      scale: 1.2,
                    ),
                  ),
                  MovieInfo(size: size),
                ],
              ),
            ),
            //---------------------------------//
            buildPriceTag('Mã Đặt Vé', 'OP123'),
            buildPriceTag('Rạp Phim', 'CGV Vincom Thủ Đức'),
            buildPriceTag('Ngày & Giờ', 'T7 26/11,  21:20 PM'),
            buildPriceTag('Số Ghế', 'C3, C4'),
            buildPriceTag('Giá Ghế', '80.000 VND x 2'),
            buildPriceTag('Tổng Tiền', '160.000 VND'),
            //---------------------------------//
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.only(bottom: 24),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ThemeColor.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Center(
                  child: Container(
                    height: size.height / 15,
                    width: size.width / 2,
                    decoration: BoxDecoration(
                        color: DarkTheme.blueMain,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Đặt',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 23,
                          height: 1.2),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPriceTag(String content, String price) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            content,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 1.2,
                color: ThemeColor.black,
                decoration: TextDecoration.none),
          ),
          Text(
            price,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                height: 1.2,
                decoration: TextDecoration.none,
                color: ThemeColor.black),
          ),
        ],
      ),
    );
  }
}
