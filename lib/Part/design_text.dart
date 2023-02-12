import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class TextContainerA extends StatelessWidget {

  final String StringNumber;

  const TextContainerA({
    required this.StringNumber,
  });

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    return Container(
      color: Colors.transparent,
      width: appHeight * 0.224,
      height: appHeight * 0.067,
      child: Center(
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NUMBER', style: TextStyle(
                  fontSize: mainBoxHeight / 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: mainBoxHeight / 60,
              ),
              Text('DWAIX11', style: TextStyle(
                  fontSize: mainBoxHeight / 25, fontWeight: FontWeight.bold),
              ),
              // DWAIX11 // // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
            ],
          ),
          SizedBox(width: mainBoxHeight / 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GATE',
                style: TextStyle(
                    fontSize: mainBoxHeight / 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: mainBoxHeight / 60,),
              RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                        // controllerAPI.Direction == '오른쪽' ? 'RIGH'
                        //     : controllerAPI.Direction == '왼쪽' ? 'L' :
                        '01',
                        style: TextStyle(
                            color:
                                //   controllerAPI.Direction == '오른쪽' ? Colors.black
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line1' ? const Color(0xff334aae)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line2'?  const Color(0xff009D3E)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line3'?  const Color(0xffEF7C1C)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line4'?  const Color(0xff00A5DE)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line5'?  const Color(0xff996CAC)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line6'?  const Color(0xffCD7C2F)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line7'?  const Color(0xff747F00)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line8'?  const Color(0xffEA545D)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == 'Line9'?  const Color(0xffBB8336)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '서해'?    const Color(0xff8FC31F)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '공항'?    const Color(0xff0090D2)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '경의중앙'? const Color(0xff77C4A3)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '경춘'?    const Color(0xff0C8E72)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '수인분당'? const Color(0xff8FC31F)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '신분당'?   const Color(0xffD4003B)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '경강선'?   const Color(0xff003DA5)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '인천1선'?  const Color(0xff7CA8D5)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '인천2선'?  const Color(0xffED8B00)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '에버라인'?  const Color(0xff6FB245)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '의정부'?   const Color(0xffFDA600)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '우이신설'? const Color(0xffB7C452)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '김포골드'? const Color(0xffA17800)
                                // : controllerAPI.Direction == '왼쪽' && StringNumber == '신림'?   const Color(0xff6789CA) :
                                 Colors.black,
                            fontSize: mainBoxHeight / 25,
                            fontWeight: FontWeight.bold),
                      ),


                      TextSpan(
                        text:
                            // controllerAPI.Direction == '오른쪽' ? 'T'
                            // : controllerAPI.Direction == '왼쪽' ? 'EFT' :
                        '00',
                        style: TextStyle(
                            color:
                                //   controllerAPI.Direction == '오른쪽' &&  StringNumber == 'Line1'? const Color(0xff334aae)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line2'?  const Color(0xff009D3E)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line3'?  const Color(0xffEF7C1C)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line4'?  const Color(0xff00A5DE)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line5'?  const Color(0xff996CAC)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line6'?  const Color(0xffCD7C2F)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line7'?  const Color(0xff747F00)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line8'?  const Color(0xffEA545D)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == 'Line9'?  const Color(0xffBB8336)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '서해'?    const Color(0xff8FC31F)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '공항'?    const Color(0xff0090D2)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '경의중앙'? const Color(0xff77C4A3)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '경춘'?    const Color(0xff0C8E72)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '수인분당'? const Color(0xff8FC31F)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '신분당'?   const Color(0xffD4003B)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '경강선'?   const Color(0xff003DA5)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '인천1선'?  const Color(0xff7CA8D5)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '인천2선'?  const Color(0xffED8B00)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '에버라인'?  const Color(0xff6FB245)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '의정부'?   const Color(0xffFDA600)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '우이신설'? const Color(0xffB7C452)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '김포골드'? const Color(0xffA17800)
                                // : controllerAPI.Direction == '오른쪽' && StringNumber == '신림'?   const Color(0xff6789CA)
                                // : controllerAPI.Direction == '왼쪽'
                                // ? Colors.black :
                                 Colors.black,
                            fontSize: mainBoxHeight / 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
