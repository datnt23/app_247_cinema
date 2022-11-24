import 'package:app_247_cinema/utils/theme.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      height: size.height/14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ThemeColor.black),
      ),
      child: Row(
        children: const [
          Expanded(child: TextField(
            decoration: InputDecoration(
              hintText: 'Select Your Country',
              hintStyle: TextStyle(fontWeight: FontWeight.w200,
      fontSize: 20,
      height: 1.2,
      color: ThemeColor.black,
      decoration: TextDecoration.none)
            ),
          ))
        ],
      ),
    );
  }
}