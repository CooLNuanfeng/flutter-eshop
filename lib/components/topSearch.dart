import 'package:flutter/material.dart';
import 'textScroll.dart';

class TopSearch extends StatelessWidget {
  TopSearch({
    Key key,
    this.type, //背景类型  1 2背景色  3背景图  4左右渐变  5上下渐变  6透明
  }) : super(key: key);
  final int type;

  Widget build(BuildContext context) {
    final statusHeight = MediaQuery.of(context).padding.top;
    // print(this.type);
    // TODO: implement build
    switch (this.type) {
      case 1:
      case 2:
        return Container(
          padding: EdgeInsets.only(top: statusHeight),
          height: 50.0,
          color: Colors.red,
          child: Content(),
        );
        break;
      case 3:
        return Container(
          padding: EdgeInsets.only(top: statusHeight),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  image: NetworkImage(
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/6898342ced754d2d82727f6eb87db8ce.jpg'))),
          height: 50.0,
          // color: Colors.red,
          child: Content(),
        );
        break;
      case 4:
        return Container(
          padding: EdgeInsets.only(top: statusHeight),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.red, Colors.cyan],
          )),
          height: 50.0,
          child: Content(),
        );
        break;
      case 5:
        return Container(
          padding: EdgeInsets.only(top: statusHeight),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.cyan],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter)),
          height: 50.0,
          child: Content(),
        );
        break;
      default:
    }
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2020/10/27f48733332b4ea3be1d3ee1c64066bc.png'))),
              width: 44.0,
              height: 22.0,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                  width: 186.0,
                  height: 36.0,
                  // color: Colors.white,r
                ),
                Positioned(
                    top: 8.0,
                    left: 12.0,
                    child: Image.asset(
                      'assets/search.png',
                      width: 22.0,
                      height: 22.0,
                    )),
                Positioned(
                  top: 6.0,
                  left: 36.0,
                  child: Container(
                    width: 130.0,
                    height: 26.0,
                    child: VerticalScrollScene(),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Image.network(
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/1a09636d1064453e9e0fcccfdb6654df.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Image.network(
                        'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/21e70c6b8d5a4fef857fbb4cc1c2e343.png',
                        width: 22.0,
                        height: 22.0,
                      ),
                    ),
                    Positioned(
                        top: -8.0,
                        right: -8.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 40, 86, 1),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10.0),
                                right: Radius.circular(10.0),
                              )),
                          child: Text(
                            '8',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Image.network(
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2020/10/63897fcc73f043db86449df436f3063d.png',
                    width: 22.0,
                    height: 22.0,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
