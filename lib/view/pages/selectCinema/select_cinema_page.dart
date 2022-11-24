import 'package:app_247_cinema/view/pages/selectCinema/components/select_country.dart';
import 'package:flutter/material.dart';

import 'components/custom_header.dart';

class SelectCinemaPage extends StatelessWidget {
  const SelectCinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomHeader(
              size: size,
              content: 'Ralph Breaks the\nInternet ',
            ),
            SelectCountry(size: size),
            buildTitle('Choose Date'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: days
                    .map((e) => Builder(
                          builder: (context) => buildDateWidget(size, e),
                        ))
                    .toList(),
              ),
            ),
            // buildTitle('Central Park CGV'),
            // Container(
            //   margin: const EdgeInsets.only(top: 8, bottom: 16),
            //   height: size.height / 15,
            //   child: ListView.builder(
            //     itemBuilder: (context, index) =>
            //         _buildTimeWidget(size, index, timeStates_1),
            //     itemCount: times.length,
            //     scrollDirection: Axis.horizontal,
            //   ),
            // ),
            // buildTitle('FX Sudirman XXI'),
            // Container(
            //   margin: const EdgeInsets.only(top: 8, bottom: 16),
            //   height: size.height / 15,
            //   child: ListView.builder(
            //     itemBuilder: (context, index) =>
            //         _buildTimeWidget(size, index, timeStates_2),
            //     itemCount: times.length,
            //     scrollDirection: Axis.horizontal,
            //   ),
            // ),
            // buildTitle('Kelapa Gading IMAX'),
            // Container(
            //   margin: const EdgeInsets.only(top: 8, bottom: 16),
            //   height: size.height / 15,
            //   child: ListView.builder(
            //     itemBuilder: (context, index) =>
            //         _buildTimeWidget(size, index, timeStates_3),
            //     itemCount: times.length,
            //     scrollDirection: Axis.horizontal,
            //   ),
            // ),
            // NextButton(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const SelectSeatPage()));
            //   },
            // )
          ],
        ),
      ),
    );
  }
}