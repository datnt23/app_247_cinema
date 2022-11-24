import 'package:app_247_cinema/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.content,
    required this.size,
  }) : super(key: key);

  final String content;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height / 10,
          child: Center(
            child: Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.w400, 
                fontSize: 30, 
                height: 1.2
                ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, top: 4),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: ThemeColor.white,
            ),
          ),
        ),
      ],
    );
  }
}
