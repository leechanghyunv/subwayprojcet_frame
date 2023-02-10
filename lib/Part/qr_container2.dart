import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class DialogDesignSMS extends StatelessWidget {

  String QRdata = '1234ffov3pp5oq23lk';

  final String DesignText;
  /// civil complaint Box
  DialogDesignSMS({
    required this.DesignText,
  });

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height; /// 896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width; /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    return Container(
      child: Row(
        children: [
          Container(
            decoration:  BoxDecoration(
            ),
            width: appHeight * 0.0893,  /// 80
            height: appHeight * 0.0893,
            child: QrImage(
              data: QRdata,
            ),
          ),
          SizedBox(width: appHeight * 0.028,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${DesignText}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: appHeight * 0.0168,color: Colors.black),),
              Text(
                DateFormat('y-MM-dd EEE \nHH:mm:ss').format(DateTime.now()),
                style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: appHeight * 0.0168,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }


}