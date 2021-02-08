import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';

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

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  //底部nav globalkey
  GlobalKey key;

  ScrollController _scrollController;

  double bgRadiusTop = 0;
  double statusHeight;
  bool fixedNav = false;

  final tabsData = jsonDecode('''{
    "tab": [
      {"productCateId": 2729, "name": "空调", "tag": "悦享呼吸"},
      {"productCateId": 2725, "name": "洗衣机", "tag": "守护洁净"},
      {"productCateId": 2723, "name": "冰箱", "tag": "原味鲜活"},
      {"productCateId": 2743, "name": "彩电", "tag": "视听万象"},
      {"productCateId": 2741, "name": "热水器", "tag": "温暖到家"},
      {"productCateId": 2742, "name": "厨房电器", "tag": "乐享美味"},
      {"productCateId": 2726, "name": "冷柜", "tag": "冻力强劲"},
      {"productCateId": 2973, "name": "智能产品", "tag": "科技体验"},
      {"productCateId": 4255, "name": "生活电器", "tag": "品质生活"},
      {"productCateId": 2774, "name": "水家电", "tag": "洁净用水"},
      {"productCateId": 2811, "name": "家用中央空调", "tag": "舒适陪伴"}
    ]
  }''');

  @override
  void initState() {
    super.initState();
    key = GlobalKey(debugLabel: 'btmNav');
    print('====key=====');
    print(key);
    print('====key=====');
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

      RenderBox box = key.currentContext.findRenderObject();
      Offset os = box.localToGlobal(Offset.zero);
      if (os.dy < statusHeight) {
        print('======fixed======');
      } else {
        print('======cancel fixed======');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    statusHeight = MediaQuery.of(context).padding.top;
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
                      children: [
                        Body(
                          btmNavKey: key,
                          tabNav: tabsData['tab'],
                        ),
                      ],
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
                fixedNav
                    ? Positioned(
                        top: 50 + statusHeight,
                        left: 0,
                        right: 0,
                        height: 45,
                        child: Container(),
                      )
                    : Positioned(child: Container()),
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
  final btmNavKey;
  final tabNav;
  Body({Key key, this.btmNavKey, this.tabNav}) : super(key: key);
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
        BtmCategory(
          btmCatekey: btmNavKey,
          tabNav: tabNav,
        ),
      ],
    );
  }
}
