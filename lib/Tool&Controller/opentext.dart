import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainText extends StatefulWidget {

  final String subwayName;
  final String engName;

  MainText({
    required this.subwayName,
    required this.engName,
  });



  @override
  State<MainText> createState() => _MainTextState();
}


class _MainTextState extends State<MainText> {

  bool _show = true;
  Timer? _timer;
  var counter = 8;
  // final _random = Random();
  // final colorsA = [
  //   Color(0xff2b3990),  /// 1호선
  //   Color(0xff009D3E),  /// 2호선
  //   Color(0xffEF7C1C),  /// 3호선
  //   Color(0xff00A5DE),  /// 4호선
  //   Color(0xff996CAC),  /// 5호선
  //   Color(0xffCD7C2F),  /// 6호선
  //   Color(0xff747F00),  /// 7호선
  //   Color(0xffEA545D),  /// 8호선
  //   Color(0xffBB8336),  /// 9호선
  // ];

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (_) {
      setState(() {
        _show = !_show;
      });
      counter--;
      if (counter == 0) {
        print('Cancel timer');
        _timer?.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    return Container(
      height: appHeight * 0.58 * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.subwayName == 'SEOUL'? 'SEOUL' : '${widget.subwayName}',maxLines: 1, style: _show?
            TextStyle(
              // color: colorsA[_random.nextInt(colorsA.length)],
              fontWeight: FontWeight.bold,
              fontSize:
              /// IPHONE 11 기준 mainBoxHeight == 520
              widget.subwayName.length == 3? mainBoxHeight/8 /// 80
                  : widget.subwayName.length == 4 ? mainBoxHeight/8.5 /// 80
                  : widget.subwayName.length == 5 ? mainBoxHeight/8.5 /// 80
                  : widget.subwayName.length == 6 ? mainBoxHeight/8.6 /// 60
                  : widget.subwayName.length == 7 ? mainBoxHeight/8.6 /// 60
                  : widget.subwayName.length == 8 ? mainBoxHeight/11.4 /// 45
                  : widget.subwayName.length == 9 ? mainBoxHeight/11.4 /// 45
                  : mainBoxHeight/14.4,
              overflow: TextOverflow.ellipsis,
            )
                : TextStyle(color: Colors.transparent),
            ),
            Text('    ${widget.engName}', style: TextStyle(
                fontSize: mainBoxHeight/35),),
          ],
        ),
      ),
    );
  }
}