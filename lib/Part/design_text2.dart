import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../Page/mainpage.dart';
import '../Tool&Controller/getx_api.dart';
import '../Tool&Controller/getx_convert.dart';


class TextContainerB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height; /// 896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width; /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    final Api_Upside = Get.put(SubwayDataControllerU());
    final Api_Downside = Get.put(SubwayDataControllerD());
    final Convert_Type = Get.put(Inter_Changer());


    return RotatedBox(
      quarterTurns: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DATE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: mainBoxHeight/25),),
                  SizedBox(
                    height: mainBoxHeight/60,
                  ),
                  Text(
                    DateFormat('MM/dd ').format(DateTime.now()),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight/25),
                  ),
                ],
              ),  /// DATE
              SizedBox(width: mainBoxHeight/25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SEAT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: mainBoxHeight/25),),
                  SizedBox(
                    height: mainBoxHeight/60,
                  ),
                  Text('13XX',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mainBoxHeight/25),),

                ],
              ), /// SEAT
              SizedBox(width: mainBoxHeight/25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CLASS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: mainBoxHeight/25),),
                  SizedBox(
                    height: mainBoxHeight/60,
                  ),
                  Text(
                    // controllerAPI_D.Type == null? 'NOR(S)'
                    //   : controllerAPI_D.Type == '??????'? 'EXP(S)'
                    //   : controllerAPI_D.Type == 'ITX' ? 'ITX(T)' :
                    'NOR(S)',

                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mainBoxHeight/25),),
                ],
              ), /// CLASS
            ],
          ),
          SizedBox(
            height: mainBoxHeight/10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PASSENGER :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: mainBoxHeight/25),
              ),
              SizedBox(
                height: mainBoxHeight/40,
              ),
              Text(
                box.read('Name') ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: mainBoxHeight/30),
              ),
            ],
          ), /// PASSENGER NAME
        ],
      ),
    );
  }
}