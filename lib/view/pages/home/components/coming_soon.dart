import 'package:app_247_cinema/src/models/movie.dart';
import 'package:app_247_cinema/views/pages/movie_detail.dart';
import 'package:flutter/material.dart';
class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: movies
            .map(
              (e) => Builder(
                builder: (context) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MovieDetailPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: Image.asset(e.posterImg),
                      ),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
