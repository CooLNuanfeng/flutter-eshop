import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'components/refreshHeader.dart';
import 'components/topSearch.dart';
import 'components/swiper.dart';
import 'components/category.dart';
import 'components/middleBanner.dart';
import 'components/kingArea.dart';
import 'components/vipStore.dart';
import 'components/nearShop.dart';
import 'components/couponList.dart';
import 'components/flexArea.dart';
import 'components/btmCategory.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State {
  ScrollController _scrollController;
  double bgRadiusTop = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
      }
      setState(() {
        print(bgRadiusTop);
        if (_scrollController.offset > 0) {
          bgRadiusTop = -_scrollController.offset;
        } else {
          bgRadiusTop = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final statusHeight = MediaQuery.of(context).padding.top;
    // TODO: implement build
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      //Set the fit size (fill in the screen size of the device in the design,in dp)
      ScreenUtil.init(
        context: _,
        constraints: constraints,
        designSize: Size(375, 690),
        allowFontScaling: false,
      );
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
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
                  top: bgRadiusTop,
                  left: 0,
                  right: 0,
                  height: statusHeight + 134,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(375, 64))),
                  ),
                ),
                Positioned(
                  top: statusHeight + 50,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: EasyRefresh(
                    header: RefreshHeader(color: Colors.white),
                    onRefresh: () async {
                      print('refresh');
                    },
                    child: ListView(
                      controller: _scrollController, //监听滚动
                      children: [Body()],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 50 + statusHeight,
                  child: TopSearch(
                    type: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Swiper(swiperItems: [
          'https://cdn50.ehaier.com/mobilemall-admin-web/bannercontroller/image/2021/01/8ab60d2d17224bc793a8eb58fec765c5.jpg',
          'https://cdn50.ehaier.com/mobilemall-admin-web/bannercontroller/image/2021/01/0aa5720f475148ab90d34247b41dc2be.jpg',
          'https://cdn50.ehaier.com/mobilemall-admin-web/bannercontroller/image/2021/01/60f434e5e10d4011b4276840beacba1b.jpg'
        ]),
        Category(),
        MiddleBannerWidget(),
        KingAreaWidget(),
        VipStoreWidget(),
        NearShop(),
        CouponList(),
        FlexArea(),
        BtmCategory(),
      ],
    );
  }
}
