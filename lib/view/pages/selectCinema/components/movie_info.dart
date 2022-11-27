import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            width: size.width,
            child: const Text(
              'ONE PIECE FILM RED',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                height: 1.2,
                decoration: TextDecoration.none,
                color: ThemeColor.black,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, bottom: 8),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: ThemeColor.starYellow,
                    size: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: ThemeColor.starYellow,
                    size: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: ThemeColor.starYellow,
                    size: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: ThemeColor.starYellow,
                    size: 10,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: FaIcon(
                    FontAwesomeIcons.solidStar,
                    color: ThemeColor.starYellow,
                    size: 10,
                  ),
                ),
                Text(
                  '(5.0)',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.2,
                      decoration: TextDecoration.none,
                      color: ThemeColor.black),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            width: size.width,
            child: const Text(
              'Hoạt Hình',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.2,
                  color: ThemeColor.black,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            width: size.width,
            child: const Text(
              '115 phút',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.2,
                  color: ThemeColor.black,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}
