import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/textoverflow.dart';
import '../common/itemMore.dart';

class CouponList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
      height: ScreenUtil().setHeight(70),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: CouponListWidget(),
      ),
    );
  }
}

class CouponListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        CouponItem(
          type: 'FIXED_CASH_COUPON',
          hasGet: false,
        ),
        CouponItem(
          type: 'REBATE_COUPON',
          hasGet: true,
        ),
        CouponItem(
          type: 'DISCOUNT_COUPON',
          hasGet: false,
        ),
        ItemMore(),
      ],
    );
  }
}

class CouponItem extends StatefulWidget {
  final type;
  final bool hasGet;
  CouponItem({Key key, this.type, this.hasGet}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CouponItemState();
}

class _CouponItemState extends State<CouponItem> {
  bool hasGet = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      hasGet = widget.hasGet;
    });
  }

  void doGetCoupon() {
    setState(() {
      hasGet = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => {doGetCoupon()},
      child: Container(
          margin: EdgeInsets.only(right: 8),
          width: ScreenUtil().setWidth(120),
          height: ScreenUtil().setHeight(70),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                      'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/new/coupon_bg.png'))),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  children: [
                    Container(
                        width: ScreenUtil().setWidth(96),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              widget.type == 'DISCOUNT_COUPON'
                                  ? CouponDiscountText(
                                      count: '9.5',
                                    )
                                  : CouponPriceText(
                                      price: '100',
                                    ),
                              CouponTextInfo(
                                text: '满2可用满2可用满2可用满2可用满2可用',
                                width: 80,
                              ),
                              CouponTextInfo(
                                text: '满减订单',
                                width: 80,
                              )
                            ],
                          ),
                        )),
                    Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(10),
                      height: ScreenUtil().setHeight(50),
                      child: Text(hasGet ? '去使用' : '领取',
                          softWrap: true,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ],
                ),
              ),
              hasGet
                  ? Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                    'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/new/coupon_disable.png'))),
                        width: ScreenUtil().setWidth(43),
                        height: ScreenUtil().setWidth(40),
                      ))
                  : Container()
            ],
          )),
    );
  }
}

class CouponDiscountText extends StatelessWidget {
  final count;
  CouponDiscountText({Key key, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            count,
            softWrap: true,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 80, 14, 1),
                fontWeight: FontWeight.w600),
          ),
          Text(
            '折',
            style:
                TextStyle(fontSize: 14, color: Color.fromRGBO(255, 80, 14, 1)),
          ),
        ],
      ),
    );
  }
}

class CouponPriceText extends StatelessWidget {
  final price;
  CouponPriceText({Key key, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '￥',
            style:
                TextStyle(fontSize: 14, color: Color.fromRGBO(255, 80, 14, 1)),
          ),
          Text(
            price,
            softWrap: true,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 80, 14, 1),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class CouponTextInfo extends StatelessWidget {
  final width;
  final text;
  CouponTextInfo({Key key, this.text, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextOverflowInfo(
      color: Color.fromRGBO(255, 80, 14, 1),
      width: width,
      text: text,
    );
  }
}
