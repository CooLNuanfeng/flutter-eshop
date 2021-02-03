import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'components/topSearch.dart';
import 'components/swiper.dart';
import 'components/category.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final statusHeight = MediaQuery.of(context).padding.top;
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              height: statusHeight + 50,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 1000,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                              image: NetworkImage(
                                  'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/6898342ced754d2d82727f6eb87db8ce.jpg'))),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: statusHeight + 124,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(375, 64))),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: TopSearch(
                      type: 3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Body(),
            )
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new EasyRefresh(
      child: Column(
        children: [
          Swiper(swiperItems: [
            'https://cdn50.ehaier.com/mobilemall-admin-web/bannercontroller/image/2021/01/8ab60d2d17224bc793a8eb58fec765c5.jpg',
            'https://cdn50.ehaier.com/mobilemall-admin-web/bannercontroller/image/2021/01/0aa5720f475148ab90d34247b41dc2be.jpg',
            'https://cdn50.ehaier.com/mobilemall-admin-web/bannercontroller/image/2021/01/60f434e5e10d4011b4276840beacba1b.jpg'
          ]),
          Category()
        ],
      ),
      onRefresh: () async {
        print('refresh');
      },
    );
  }
}
