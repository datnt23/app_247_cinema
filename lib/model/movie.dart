
import 'package:flutter/cupertino.dart';

class Movie {
  final int id;
  final String name;
  final List<String> genre;
  final double rating;
  final String director;
  final String stroyLine;
  final Image image;
  final Image imageLogo;

  Movie({
      required this.id,
      required this.name,
      required this.genre,
      required this.rating,
      required this.director,
      required this.stroyLine,
      required this.image,
      required this.imageLogo,
      });
}
