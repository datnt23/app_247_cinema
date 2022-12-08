import 'package:flutter/material.dart';

import '../../utils/theme_colors.dart';

class ViewAllTitleWidget extends StatelessWidget {
  const ViewAllTitleWidget(
      {super.key,
      required this.title,
      this.suffixText = "See All",
      this.onSuffixClick});

  final String title;
  final String suffixText;
  final void Function()? onSuffixClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            height: 1.2,
            decoration: TextDecoration.none,
            color: ThemeColor.black),
        ),
        InkWell(
          onTap: onSuffixClick,
          child: Text(
            suffixText,
            style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.5,
            decoration: TextDecoration.none,
            color: ThemeColor.white),
          ),
        ),
      ],
    );
  }
}
