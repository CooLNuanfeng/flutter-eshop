import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VerticalScrollScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 62,
      // color: Colors.white,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 26,
          viewportFraction: 1.0,
          autoPlayInterval: Duration(seconds: 5),
          autoPlay: true,
          scrollDirection: Axis.vertical,
        ),
        items: ["111111111", "2222222222"].map((info) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                child: _carouselItemView(info),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  _carouselItemView(String info) {
    return Container(
      child: Text(
        info,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            decoration: TextDecoration.none,
            color: Colors.grey),
      ), // 下划线去不掉，就把下划线颜色设置成背景色，相当于去了下划线
    );
  }
}
