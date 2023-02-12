import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ColorContainer.dart';

class DialogDesignBox3 extends StatelessWidget {
  String stringNumber;
  String subwayName;

  DialogDesignBox3({
    required this.stringNumber,
    required this.subwayName,
  });

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;

    /// 896.0 IPHONE11  appHeight * 0.0112 = 10.03
    double appWidth = MediaQuery.of(context).size.width;

    /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    return Container(
      height: appHeight * 0.0672,

      /// appHeight * 0.0672
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            height: appHeight * 0.0672,
            width: appHeight * 0.0168,
            child: ColorContainer(StringNumber: stringNumber),
          ),
          SizedBox(
            width: appHeight * 0.0112,
          ),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.0560,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('LineN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text(
                  '${stringNumber}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: appHeight * 0.0168),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: appHeight * 0.0112,
          ),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.0784,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('Location',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('${subwayName}역',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(
            width: appHeight * 0.0112,
          ),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text('SMS Call',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168)),
                SizedBox(
                  height: appHeight * 0.0112,
                ),
                Text( stringNumber == 'Line1' ? '1577-1234'
                    : stringNumber == 'Line2' ? '1577-1234'
                    : stringNumber == 'Line3' ? '1577-1234'
                    : stringNumber == 'Line4' ? '1577-1234'
                    : stringNumber == 'Line5' ? '1577-1234'
                    : stringNumber == 'Line6' ? '1577-1234'
                    : stringNumber == 'Line7' ? '1577-1234'
                    : stringNumber == 'Line8' ? '1577-1234'
                    : stringNumber == 'Line9' ? '1577-4009'
                    : stringNumber == '신분당' ? '(031)8018-7777'
                    : '1544-7769',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appHeight * 0.0168),
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}