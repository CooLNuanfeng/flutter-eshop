import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Swiper extends StatelessWidget {
  Swiper({Key key, this.swiperItems}) : super(key: key);
  List swiperItems;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16.0))),
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 140,
          autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: Duration(seconds: 3),
          onPageChanged: (index, reason) {
            print(index);
            print(reason);
          },
        ),
        items: this.swiperItems.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
