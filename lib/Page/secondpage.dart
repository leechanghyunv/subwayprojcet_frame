import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Part/LAFAYETTE.dart';
import '../Part/dialog_designbox3.dart';
import '../Part/qr_container2.dart';
import '../Tool&Controller/getx_controller.dart';

class secondpage extends StatelessWidget {

  final ScrollController controller;
  secondpage({super.key, required this.controller});

  final NotifyCall = Get.put(GetX_Notification());


  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;/// 520   ~ 519.68
    double mainBoxWidth = appWidth * 0.915;/// 378.81   ~ 380

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: appHeight * 0.125,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: appWidth * 0.15,
                  height: appHeight * 0.12,
                  child: LoadingAnimationWidget.fallingDot(
                      color: NotifyCall.loading == true? Colors.black38 : Colors.black38,
                      size: 30,
                    ),
                ),
                Lafayette(),
                AnimatedContainer(
                  duration: Duration(seconds: 3),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Container(
                                color: Colors.white,
                                height: appHeight * 0.369,/// 330
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    DialogDesignSMS(DesignText: 'civil complaint Box',),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: appHeight * 0.168,/// 150
                                        width: appHeight * 0.2912,/// 260
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:MainAxisAlignment.start,
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Send SMS를 누르시면 민원문자를 보내실 수 있습니다. 지하철 민원 신고시 통로문 또는 출입문 위 칸번호 4~6자리와 현재 정차하는 역에서 가는 방향을 기재해야 빠른 민원이 가능합니다.',
                                              style: TextStyle(
                                                  fontSize:appHeight * 0.0168,
                                                  fontWeight:FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '\n\n ex)오이도행 4764, 8-3번 에어컨 틀어주세요',
                                              style: TextStyle(
                                                  fontSize: appHeight * 0.0150,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DialogDesignBox3( stringNumber: 'Line2', subwayName: NotifyCall.subwayName),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel',
                                        style: TextStyle(
                                            fontSize: appHeight * 0.0168,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )),
                                ),
                                SizedBox(
                                  child: TextButton(onPressed: (){},
                                      child: Text('Send SMS',
                                        style: TextStyle(
                                            fontSize: appHeight * 0.0168,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                  ),
                                ),
                              ],
                            ));
                      },
                      child: Container(
                        width: appWidth * 0.15,
                        height: appHeight * 0.12,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: appWidth* 0.915,
            height: appHeight * 0.02,

          ),
          Container(
            color: Colors.blueGrey,
            width: appWidth * 0.915,
            height: appHeight * 0.56,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Google Map'),
              ],
            ),
          ),

          /// google map
        ],
      ),
    );
  }
}
