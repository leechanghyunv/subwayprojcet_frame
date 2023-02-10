import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';

class Lafayette extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    return  Container(
        alignment: Alignment.center,
        width: appWidth * 0.55,
        height: appHeight * 0.125,
        child: BarcodeWidget(
          data: '------LAFAYETTE.co-------',
          style: TextStyle(fontWeight: FontWeight.bold),
          barcode: Barcode.code128(),
        ));
  }
}