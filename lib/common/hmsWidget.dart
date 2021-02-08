import 'package:flutter/widgets.dart';
import 'dart:async';

class HmsWidget extends StatefulWidget {
  final int time;
  final Color color;
  final double fontsize;
  final int fontweight;
  HmsWidget({Key key, this.time, this.color, this.fontsize, this.fontweight})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HmsWidgetState();
  }
}

class _HmsWidgetState extends State<HmsWidget> {
  Timer _timer;
  String text = '';
  int count = 0;
  @override
  void initState() {
    super.initState();
    count = widget.time;
    _cumputerTimer();
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      print(timer);
      _cumputerTimer();
    });
  }

  void _cumputerTimer() {
    int hour = count ~/ 3600;
    int minute = count % 3600 ~/ 60;
    int second = count % 60;
    setState(() {
      text = formatTime(hour) +
          ":" +
          formatTime(minute) +
          ":" +
          formatTime(second);
    });
    count--;
    if (count < 0) {
      print('===========timer end===========');
      cancelTimer();
    }
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        fontSize: widget.fontsize,
        fontWeight: FontWeight.values[widget.fontweight],
        color: widget.color,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}
