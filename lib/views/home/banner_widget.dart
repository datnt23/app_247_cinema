import 'package:app_247_cinema/controller/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  FirebaseService service = FirebaseService();
  double showedIndex = 0;
  final List banners = [];

  @override
  void initState() {
    getBanner();
    super.initState();
  }

  getBanner() {
    return service.banner.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        banners.add(doc['image']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: PageView.builder(
                itemCount: banners.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    banners[index],
                    fit: BoxFit.cover,
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    showedIndex = value.toDouble();
                  });
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: DotsIndicatorWidget(scrollPosition: showedIndex,),
        ),
      ],
    );
  }
}
class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({super.key, required this.scrollPosition});

final double scrollPosition;
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DotsIndicator(
                  position: scrollPosition,
                  dotsCount: 4,
                  decorator: DotsDecorator(
                    activeColor: Colors.lightBlue.shade400,
                    spacing: const EdgeInsets.all(12),
                    size: const Size.square(6),
                    activeSize: const Size(12, 6),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
