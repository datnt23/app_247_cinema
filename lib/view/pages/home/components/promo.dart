import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Promo extends StatelessWidget {
  const Promo({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
      child: Container(
        height: size.height / 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient:
              const LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Student Holiday',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 1.2),
                    ),
                    Text(
                      'Maximal only for two people',
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
            ),
            Expanded(
                child: Center(
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: 'OFF',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          height: 1.2,
                          decoration: TextDecoration.none,
                          color: ThemeColor.black)),
                  TextSpan(
                      text: '50%',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 1.2,
                          color: ThemeColor.black))
                ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
