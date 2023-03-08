import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Tool&Controller/getx_controller.dart';

class MainText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final NotifyCall = Get.put(GetX_Notification());

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
            Text(NotifyCall.subwayName == 'SEOUL' ? 'SEOUL' : '${NotifyCall.subwayName}역',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                         /// IPHONE 11 기준 mainBoxHeight == 520
                        NotifyCall.subwayName.length == 2 ? mainBoxHeight / 8/// 80
                      : NotifyCall.subwayName.length == 3 ? mainBoxHeight / 8.5/// 80
                      : NotifyCall.subwayName.length == 4 ? mainBoxHeight / 8.5/// 80
                      : NotifyCall.subwayName.length == 5 ? mainBoxHeight / 8.6/// 60
                      : NotifyCall.subwayName.length == 6 ? mainBoxHeight / 8.6/// 60
                      : NotifyCall.subwayName.length == 7 ? mainBoxHeight / 11.4/// 45
                      : NotifyCall.subwayName.length == 8 ? mainBoxHeight / 11.4/// 45
                      : mainBoxHeight / 14.4,
                  overflow: TextOverflow.ellipsis,
                )),
            Text(
              NotifyCall.engName == 'SEOUL' ? ' SEOUL' : ' ${NotifyCall.engName}',
              style: TextStyle(
                  fontSize: NotifyCall.engName.length < 35 ?
                  mainBoxHeight / 35 : mainBoxHeight / 40,
                  fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}