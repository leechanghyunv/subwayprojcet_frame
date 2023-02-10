import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Part/LAFAYETTE.dart';

class secondpage extends StatelessWidget {
  late bool Loading = false;
  final ScrollController controller;
  secondpage({super.key, required this.controller});

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
                  // child: LoadingAnimationWidget.waveDots(
                  //     color: Colors.black38,
                  //     size: 20,
                  //   ),

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
                                    
                                  ],
                                ),
                              ),
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
