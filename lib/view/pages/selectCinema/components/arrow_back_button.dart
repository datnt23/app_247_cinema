import 'package:app_247_cinema/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 4),
      child: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: ThemeColor.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}