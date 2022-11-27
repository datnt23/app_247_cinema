import 'package:app_247_cinema/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import '../../../../src/models/movie.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key, required this.size});

  final Size size;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height/16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                alignment: Alignment.center,
                  width: widget.size.width / 4,
                  decoration: selectedIndex == index
                      ? BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ThemeColor.headerBackGround,
                      )
                      : const BoxDecoration(
                        color: ThemeColor.backGround),
                  child: Text(
                    genres[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.2,
                      decoration: TextDecoration.none,
                      color: ThemeColor.black
                    ),
                  ),
              ),
            ),
          );
        },
      ),
    );
  }
}