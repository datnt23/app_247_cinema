import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:app_247_cinema/view/pages/selectCinema/components/select_country.dart';
import 'package:app_247_cinema/views/select_seat.dart';
import 'package:app_247_cinema/views/pages/nav_bar.dart';
import 'package:flutter/material.dart';
import '../src/config/app_color.dart';
import '../src/models/movie.dart';
import '../view/pages/selectCinema/components/next_button.dart';

class SelectCinemaPage extends StatelessWidget {
  const SelectCinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor.backGround,
      appBar: AppBar(
        backgroundColor: ThemeColor.headerBackGround,
        title: const Text(
          "One Piece Film Red",
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
            SelectCountry(size: size),
            buildTitle('Chọn Ngày'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: days
                    .map((e) => Builder(
                          builder: (context) => buildDateWidget(size, e),
                        ))
                    .toList(),
              ),
            ),
            buildTitle('CGV Vincom Thủ Đức'),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              height: size.height / 15,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    buildTimeWidget(size, index, timeStates_1),
                itemCount: times.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            buildTitle('CGV Vincom Gò Vấp'),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              height: size.height / 15,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    buildTimeWidget(size, index, timeStates_2),
                itemCount: times.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            buildTitle('CGV Giga Mall Thủ Đức'),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              height: size.height / 15,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    buildTimeWidget(size, index, timeStates_3),
                itemCount: times.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            NextButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectSeatPage()));
              },
            )
          ],
        ),
      ),
    );
  }

  Container buildDateWidget(Size size, String e) {
    return Container(
      height: size.height / 10,
      width: size.width / 5,
      decoration: BoxDecoration(
          color: getColor(dateStates[days.indexOf(e)]),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            e,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                height: 1.5,
                decoration: TextDecoration.none,
                color: DarkTheme.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              (20 + days.indexOf(e)).toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  height: 1,
                  decoration: TextDecoration.none,
                  color: DarkTheme.white),
            ),
          )
        ],
      ),
    );
  }

  Container buildTimeWidget(Size size, int index, List<TicketStates> states) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      width: size.width / 4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: getColor(states[index]),
          borderRadius: BorderRadius.circular(14)),
      child: Text(
        times[index],
        style: const TextStyle(
          fontWeight: FontWeight.w400,
      fontSize: 20,
      height: 1.2,
      decoration: TextDecoration.none,
      color: DarkTheme.white
        ),
      ),
    );
  }

  Color getColor(TicketStates state) {
    switch (state) {
      case TicketStates.idle:
        {
          return DarkTheme.darkBackground;
        }
      case TicketStates.active:
        {
          return DarkTheme.blueMain;
        }
      case TicketStates.busy:
        {
          return DarkTheme.greyBackground;
        }
    }
  }

  Container buildTitle(String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Text(
        content,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
            height: 1.4,
            decoration: TextDecoration.none,
            color: ThemeColor.black),
      ),
    );
  }
}
