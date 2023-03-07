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
              Text('3728C99', style: TextStyle(
                  fontSize: mainBoxHeight / 25, fontWeight: FontWeight.bold),
              ), // DWAIX11 // // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
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
                            color: Colors.black,
                            fontSize: mainBoxHeight / 25,
                            fontWeight: FontWeight.bold),
                      ),


                      TextSpan(
                        text:
                            // controllerAPI.Direction == '오른쪽' ? 'T'
                            // : controllerAPI.Direction == '왼쪽' ? 'EFT' :
                        '00',
                        style: TextStyle(
                            color: Colors.black,
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
