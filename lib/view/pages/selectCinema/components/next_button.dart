import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:flutter/material.dart';

import '../../../../src/config/app_color.dart';
import '../../../../src/constants/asset_path.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        onPressed: onTap,
        child: const ImageIcon(
          AssetImage(AssetPath.iconNext),
          color: ThemeColor.black,
          size: 30,
        ),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            primary: DarkTheme.blueMain),
      ),
    );
  }
}
