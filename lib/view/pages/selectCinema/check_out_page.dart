import 'package:app_247_cinema/view/pages/selectCinema/components/custom_header.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(content: 'Checkout\nMovie', size: size),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 24),
            ),
          ],
        ),
      ),
    );
  }
}