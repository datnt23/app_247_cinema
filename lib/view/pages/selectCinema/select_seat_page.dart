import 'package:app_247_cinema/utils/theme.dart';
import 'package:flutter/material.dart';
import '../../../src/config/app_color.dart';
import '../../../src/constants/asset_path.dart';
import '../../../src/models/movie.dart';
import 'check_out_page.dart';
import 'components/arrow_back_button.dart';
import 'components/movie_title.dart';
import 'components/toggle_button.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor.backGround,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ArrowBackButton(),
            const MovieTitle(),
            // seat status bar
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeatStatusBar(
                      color: DarkTheme.darkBackground, content: 'Available'),
                  buildSeatStatusBar(
                      color: DarkTheme.greyBackground, content: 'Booked'),
                  buildSeatStatusBar(
                      color: DarkTheme.blueMain, content: 'Your Seat'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: seatRow
                      .map((row) => Builder(builder: (context) {
                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: seatNumber.map((number) {
                                  return ToggleButton(
                                    child: Text(
                                      row + number,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          height: 1.2,
                                          decoration: TextDecoration.none,
                                          color: ThemeColor.white),
                                    ),
                                  );
                                }).toList());
                          }))
                      .toList(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Screen',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.2,
                  decoration: TextDecoration.none,
                  color: ThemeColor.black,
                ),
              ),
            ),
            Image.asset(AssetPath.screenx2),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Total Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            height: 1.5,
                            color: ThemeColor.black,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        '150.000 VND',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            height: 1,
                            decoration: TextDecoration.none,
                            color: ThemeColor.black),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckOutPage()));
                    },
                    child: Container(
                      height: size.height / 16,
                      width: size.width / 3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: DarkTheme.blueMain,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text(
                        'Book Ticket',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 23,
                            height: 1.2,
                            decoration: TextDecoration.none,
                            color: ThemeColor.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildSeatStatusBar({required Color color, required String content}) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            content,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.2,
                decoration: TextDecoration.none,
                color: ThemeColor.black),
          ),
        ),
      ],
    );
  }
}
