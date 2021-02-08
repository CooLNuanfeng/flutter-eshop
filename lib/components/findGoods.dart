import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/hmsWidget.dart';

class FindGoods extends StatelessWidget {
  final status;
  final int leftTime;
  FindGoods({Key key, this.status, this.leftTime}) : super(key: key);
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: ScreenUtil().setWidth(160),
      height: ScreenUtil().setHeight(117),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  '发现好货',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(51, 51, 51, 1),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(100),
                height: ScreenUtil().setHeight(14),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 78, 78, 1),
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Color.fromRGBO(255, 78, 78, 1)),
                      width: ScreenUtil().setWidth(45),
                      height: ScreenUtil().setHeight(14),
                      child: Text(
                        '12点场',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: HmsWidget(
                            time: leftTime,
                            color: Color.fromRGBO(255, 78, 78, 1),
                            fontsize: 11,
                            fontweight: 4,
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 7, top: 2),
            alignment: Alignment.centerLeft,
            child: Text(
              '精心挑选每日上新',
              style: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(255, 78, 78, 1)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FindGoodsItem(
                imgurl:
                    'https://cdn50.ehaier.com/shoppingmall-admin-web/newflashsalescontroller/image/2021/02/3c14d56c7f574d7dbd68f7557b7d46da.jpg',
                price: 133,
                finalPrice: 129,
              ),
              FindGoodsItem(
                imgurl:
                    'https://cdn50.ehaier.com/shoppingmall-admin-web/newflashsalescontroller/image/2021/02/3c14d56c7f574d7dbd68f7557b7d46da.jpg',
                price: 133,
                finalPrice: 129,
              ),
              FindGoodsItem(
                imgurl:
                    'https://cdn50.ehaier.com/shoppingmall-admin-web/newflashsalescontroller/image/2021/02/3c14d56c7f574d7dbd68f7557b7d46da.jpg',
                price: 133,
                finalPrice: 129,
              )
            ],
          )
        ],
      ),
    );
  }
}

class FindGoodsItem extends StatelessWidget {
  final imgurl;
  final price;
  final finalPrice;
  FindGoodsItem({Key key, this.imgurl, this.finalPrice, this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(48),
      child: Column(
        children: [
          Image.network(
            imgurl,
            width: ScreenUtil().setWidth(48),
            height: ScreenUtil().setHeight(48),
          ),
          Text(
            '￥' + finalPrice.toString(),
            style:
                TextStyle(color: Color.fromRGBO(255, 78, 78, 1), fontSize: 10),
          ),
          Text(
            '￥' + price.toString(),
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 9),
          )
        ],
      ),
    );
  }
}
