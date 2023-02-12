
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../Page/mainpage.dart';
import '../Tool&Controller/getx_controller.dart';
import 'ColorContainer.dart';

class DialogDesignBoxA extends StatelessWidget {

  String stringNumber;
  String subwayName;
  String passenger;

  DialogDesignBoxA({
    required this.stringNumber,
    required this.subwayName,
    required this.passenger,
  });

  final NotifyCall = Get.put(GetX_Notification());

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height; /// 896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width; /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    return Container(
      height: appHeight * 0.0672,
      decoration: const BoxDecoration(
          color: Colors.white),
      child:
      Row(
        children: [
          SizedBox(
            height: appHeight * 0.0672,
            width: appHeight * 0.0168,
            child:
            ColorContainer(StringNumber: stringNumber),
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
                SizedBox(height: appHeight * 0.0112,),
                Text('Date',style: TextStyle(fontWeight: FontWeight.bold, fontSize: appHeight * 0.0168)),
                SizedBox(height: appHeight * 0.0112,),
                Text(DateFormat('MM-dd').format(DateTime.now()),style:  TextStyle(fontWeight: FontWeight.bold, fontSize: appHeight * 0.0168)),
              ],
            ),
          ),
          SizedBox(width: appHeight * 0.0112,),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.0784,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appHeight * 0.0112,),
                Text('Location',style: TextStyle(fontWeight: FontWeight.bold, fontSize: appHeight * 0.0168)),
                SizedBox(height: appHeight * 0.0112,),
                Text( NotifyCall.subwayName == 'SEOUL'? 'SEOUL' : '${NotifyCall.subwayName}역',style: TextStyle(fontWeight: FontWeight.bold, fontSize: appHeight * 0.0168),overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          SizedBox(width: appHeight * 0.0112,),
          Container(
            height: appHeight * 0.0784,
            width: appHeight * 0.1008,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: appHeight * 0.0112,),
                Text('Passenger',style: TextStyle(fontWeight: FontWeight.bold, fontSize: appHeight * 0.0168)),
                SizedBox(height: appHeight * 0.0112,),
                Text(box.read('Name') ?? '',style: TextStyle(fontWeight: FontWeight.bold, fontSize: appHeight * 0.0168),overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}