import 'package:app_247_cinema/src/constants/asset_path.dart';
import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
      height: size.height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 4,
          color: ThemeColor.black),
      ),
      child: Row(
        children: const [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Chọn địa điểm rạp phim...',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    height: 1.5,
                    color: ThemeColor.black,
                    decoration: TextDecoration.none),
                icon: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ImageIcon(
                    AssetImage(AssetPath.iconLocation),
                    color: ThemeColor.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 36,
              color: ThemeColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
