import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sms_container extends StatelessWidget {
  const sms_container({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    return Container(
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
    );
  }
}
