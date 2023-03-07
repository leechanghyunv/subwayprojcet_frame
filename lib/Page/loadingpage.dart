import 'dart:async';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Tool&Controller/opentext.dart';
import 'mainpage.dart';

class loadingpage extends StatefulWidget {
  const loadingpage({Key? key}) : super(key: key);

  @override
  State<loadingpage> createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {

  late String subwayNameO = 'SEOUL';
  late String engNameO = '';

  @override
  void initState() {
    Timer(
      Duration(milliseconds: 1500),
          () => Navigator.pushReplacement(context,
          PageTransition(child: MyHomePage(), type: PageTransitionType.fade)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    double mainBoxWidth = appWidth * 0.915;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(children: <Widget>[
            Container(
              color: Colors.white,
              height: appHeight * 0.17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  height: appHeight * 0.73,
                  width: appWidth * 0.0425,
                ),
                Container(
                  color: Colors.white,
                  height: appHeight * 0.73,
                  width: appWidth * 0.915,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: const DottedLine(
                          dashLength: 15,
                          dashGapLength: 6,
                          lineThickness: 7,
                          dashColor: Colors.white,
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  height: mainBoxHeight / 20,
                                ),
                                SizedBox(
                                  height: appHeight * 0.58 * 0.90,
                                  width: appWidth * 0.08,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: mainBoxHeight / 50,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: mainBoxHeight / 25,
                                ),
                                Container(
                                  height: appWidth * 0.13,
                                  width: mainBoxHeight / 5.5,
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: mainBoxHeight / 25,
                                ),
                                MainText(
                                    subwayName: subwayNameO, engName: engNameO),
                              ],
                            ),
                            SizedBox(
                              width: appRatio >= 0.5
                                  ? mainBoxHeight / 6
                                  : mainBoxHeight / 15,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: appWidth * 0.35,
                            height: appWidth * 0.08,
                            color: Colors.white,
                            child: Column(
                              children: const <Widget>[
                                Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: appHeight * 0.73,
                  width: appWidth * 0.0425,
                ),
              ],
            ),
          ]),
        )
    );
  }
}
