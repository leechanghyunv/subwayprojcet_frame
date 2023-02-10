import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String subwayName;
  final String engName;

  MainText({
    required this.subwayName,
    required this.engName,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subwayName == 'SEOUL' ? 'SEOUL' : '${subwayName}역',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                         /// IPHONE 11 기준 mainBoxHeight == 520
                        subwayName.length == 2 ? mainBoxHeight / 8/// 80
                      : subwayName.length == 3 ? mainBoxHeight / 8.5/// 80
                      : subwayName.length == 4 ? mainBoxHeight / 8.5/// 80
                      : subwayName.length == 5 ? mainBoxHeight / 8.6/// 60
                      : subwayName.length == 6 ? mainBoxHeight / 8.6/// 60
                      : subwayName.length == 7 ? mainBoxHeight / 11.4/// 45
                      : subwayName.length == 8 ? mainBoxHeight / 11.4/// 45
                      : mainBoxHeight / 14.4,
                  overflow: TextOverflow.ellipsis,
                )),
            Text(
              subwayName == 'SEOUL' ? '' : ' ${engName}',
              style: TextStyle(fontSize: mainBoxHeight / 35),
            ),
          ],
        ),
      ),
    );
  }
}