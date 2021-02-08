import 'package:flutter/material.dart';

import './findGoods.dart';
import './flexBigArea.dart';
import './flexSmallArea.dart';

class FlexArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FindGoods(
                    leftTime: 80,
                  ),
                  FlexBigArea(
                    title: '智能场景',
                    desc: '全屋智能解决方案',
                    link: '',
                    color: Colors.blue,
                    more: '一站式选购',
                    img:
                        'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/13ecb6586f5a4ced88ea28fcc28ad1bd.png',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlexSmallArea(
                      title: '大转盘',
                      desc: '疯狂转转转',
                      link: '',
                      color: Colors.blue,
                      img:
                          'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/ec836cd517664c9d96fba0e5ccad2033.png'),
                  FlexSmallArea(
                      title: '大转盘',
                      desc: '疯狂转转转',
                      link: '',
                      color: Colors.blue,
                      img:
                          'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/ec836cd517664c9d96fba0e5ccad2033.png'),
                  FlexSmallArea(
                      title: '大转盘',
                      desc: '疯狂转转转',
                      link: '',
                      color: Colors.blue,
                      img:
                          'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/ec836cd517664c9d96fba0e5ccad2033.png'),
                  FlexSmallArea(
                      title: '大转盘',
                      desc: '疯狂转转转',
                      link: '',
                      color: Colors.blue,
                      img:
                          'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/ec836cd517664c9d96fba0e5ccad2033.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlexBigArea(
                    title: '智能场景',
                    desc: '全屋智能解决方案',
                    link: '',
                    color: Colors.blue,
                    more: '一站式选购',
                    img:
                        'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/13ecb6586f5a4ced88ea28fcc28ad1bd.png',
                  ),
                  FlexBigArea(
                    title: '智能场景',
                    desc: '全屋智能解决方案',
                    link: '',
                    color: Colors.blue,
                    more: '一站式选购',
                    img:
                        'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/13ecb6586f5a4ced88ea28fcc28ad1bd.png',
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
