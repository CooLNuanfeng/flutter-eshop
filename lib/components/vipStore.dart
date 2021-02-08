import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/itemMore.dart';

class VipStoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 12, left: 12, right: 12),
      height: ScreenUtil().setHeight(65),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: VipShop(),
      ),
    );
  }
}

class VipShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [VipShopItem(), VipShopItem(), VipStopMore()],
    );
  }
}

class VipShopItemBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(243, 247, 255, 1),
          borderRadius: BorderRadius.circular(12)),
      width: ScreenUtil().setWidth(332),
      height: ScreenUtil().setHeight(65),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 15,
            child: Image.network(
                'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/renzhen_tag.png'),
            width: 41,
            height: 36,
          ),
          Positioned(
            top: 8,
            left: 12,
            right: 12,
            bottom: 8,
            child: Row(
              children: [
                Image.network(
                  'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/zhijia.png',
                  width: 42,
                  height: 42,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(250),
                        child: Text(
                          '博然崂山博然崂山博然崂山博然崂山博然崂山博然崂山博然崂山博然崂山博然崂山博然崂山',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(250),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Image.network(
                                  'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/vip_tag.png',
                                  width: 49,
                                  height: 12,
                                )),
                            Image.network(
                              'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/gf_tag.png',
                              width: 49,
                              height: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VipShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: Color.fromRGBO(243, 247, 255, 1),
          borderRadius: BorderRadius.circular(12)),
      width: ScreenUtil().setWidth(240),
      height: ScreenUtil().setHeight(65),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 15,
            child: Image.network(
                'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/renzhen_tag.png'),
            width: 41,
            height: 36,
          ),
          Positioned(
            top: 8,
            left: 12,
            right: 12,
            bottom: 8,
            child: Row(
              children: [
                Image.network(
                  'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/zhijia.png',
                  width: 42,
                  height: 42,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(160),
                        child: Text(
                          '博然崂山',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(160),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Image.network(
                                  'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/vip_tag.png',
                                  width: 49,
                                  height: 12,
                                )),
                            Image.network(
                              'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/gf_tag.png',
                              width: 49,
                              height: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VipStopMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ItemMore();
  }
}
