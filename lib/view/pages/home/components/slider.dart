import 'package:app_247_cinema/src/models/movie.dart';
import 'package:app_247_cinema/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../selectCinema/select_cinema_page.dart';

class SliderBar extends StatelessWidget {
  const SliderBar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: movies
          .map(
            (e) => Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectCinemaPage()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.only(left: 10, bottom: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(e.backgroundImg),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black12,
                              Colors.black54,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: size.width,
                              padding:
                                  const EdgeInsets.only(bottom: 5, left: 10),
                              child: Text(
                                e.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23,
                                    height: 1,
                                    decoration: TextDecoration.none,
                                    color: ThemeColor.white),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                children: const [
                                  //Star Component
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
                                        color: ThemeColor.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
          .toList(),
      options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
    );
  }
}
