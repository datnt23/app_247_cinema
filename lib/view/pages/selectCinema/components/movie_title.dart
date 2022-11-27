import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 24, top: 8),
          child: const Text(
            'ONE PIECE FILM RED',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                height: 1.2,
                decoration: TextDecoration.none,
                color: ThemeColor.black),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4, left: 24),
          child: const Text(
            'CGV Vincom Thủ Đức',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 1.2,
                color: ThemeColor.black,
                decoration: TextDecoration.none),
          ),
        ),
      ],
    );
  }
}
