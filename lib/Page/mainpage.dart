import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subway_project_230208/Page/secondpage.dart';
import 'package:subway_project_230208/Part/qr_container.dart';
import '../Model/model.dart';
import '../Part/colorcontainer.dart';
import '../Part/design_text.dart';
import '../Part/design_text2.dart';
import '../Part/dialog_designbox1.dart';
import '../Part/dialog_designbox2.dart';
import '../Part/main_text.dart';
import '../Part/topdesign.dart';
import '../Tool&Controller/getx_controller.dart';
import '../Tool&Controller/getx_convert.dart';
import '../Tool&Controller/number_picker1.dart';
import '../Tool&Controller/number_picker2.dart';
import '../custom_widget/drop_down.dart';
import '../custom_widget/name_textfield.dart';
import '../custom_widget/subway_textfield.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:timer_snackbar/timer_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

final box = GetStorage();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String stringNumber = 'Line2';
  late String stringNumberT = 'Line2';

  late String subwayname = '서울';
  late String subwaynameT = '서울';

  int _currentValue = 0;
  int _secondValue = 0;

  bool showTable = false;
  late bool ConvertDirection = false;
  late String Direction = '상행';

  TextEditingController controllerName = TextEditingController();



  final NotifyCall = Get.put(GetX_Notification());

  void convertor(int number) {
    if (number == 0) {
      setState(() => showTable = !showTable);
    } else if (number == 1) {
      setState(() => showTable = !showTable);
    } else if (number == 2) {
      setState(() => showTable = !showTable);
    } else {showTable = false;}
  }

  void change_type(){
    Inter_Changer inter_changer = Inter_Changer();
    inter_changer.convertLine(_currentValue);
    setState(() => stringNumber = inter_changer.subway_line );
    print(stringNumber);
  }
  void change_typeT(){
    Inter_Changer inter_changer = Inter_Changer();
    inter_changer.convertLine(_currentValue);
    setState(() => stringNumberT = inter_changer.subway_line);
    print(stringNumberT);
  }

  Future<void> OpenDialog() async {
    showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(builder: (context, setState) {
              return NumberPickerDialog(
                value: _currentValue,
                onChanged: (value) => setState(() {
                    _currentValue = value;
                    change_type();
                  }),
              );
            }),
            actions: [
              Column(
                children: [
                  TextButton(
                    child: Text("Done", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    onPressed: () => Navigator.of(context).pop()
                  ),
                ],
              )
            ],
          );
        }
        );
  }

  Future<void> SecondDialog() async {
    showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(builder: (context, setState) {
              return NumberPickerDialog2(
                value: _currentValue,
                onChanged: (value) => setState(() {
                    _currentValue = value;
                    change_type();
                  }),
                value2: _secondValue,
                onChanged2: (value) => setState(() {
                    _secondValue = value;
                    change_typeT();
                  }),
              );
            }),
            actions: [
              Column(
                children: [
                  TextButton(
                    child: Text("Done", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    onPressed: () => Navigator.of(context).pop()
                  ),
                ],
              )
            ],
          );
        });
  }

  @override
  void initState() {
    box.read('Name');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;/// 520   ~ 519.68
    double mainBoxWidth = appWidth * 0.915;/// 378.81   ~ 380

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SlidingUpPanel(
          body: Center(
            child: Column(
              children: <Widget>[
                TopDesign(),
                Container(
                  color: Colors.white,
                  height: appHeight * 0.60,
                  width: appWidth * 0.915,
                  child: Column(
                    children: <Widget>[
                      const DottedLine(
                          dashLength: 15, dashGapLength: 6, lineThickness: 7),
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
                                  child: ColorContainer(StringNumber: stringNumber),
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
                                  color: Colors.black,
                                  alignment: Alignment.center,
                                  child: DropdownCustom(
                                    value: stringNumber,
                                    onChanged: (value) {
                                      setState(() => stringNumber = value
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: mainBoxHeight / 25,
                                ),
                                MainText(),
                              ],
                            ),
                            SizedBox(
                              width: appRatio >= 0.5 ? mainBoxHeight / 6 : mainBoxHeight / 15,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: mainBoxHeight / 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              content: Container(
                                                color: Colors.white,
                                                height: appHeight * 0.3907,
                                                child: Form(
                                                  child: Column(
                                                    children: [
                                                      DialogDesign(),
                                                      Container(
                                                        child: Column(
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: appHeight * 0.0112,
                                                            ),
                                                            CustomWidget(
                                                              itemSubmitted: (value) {
                                                                setState(() {
                                                                  subwayname = value;
                                                                  NotifyCall.save_position(SubwayInfo, subwayname);

                                                                });
                                                                OpenDialog();
                                                              },
                                                            ),
                                                            SizedBox(
                                                              height: appHeight * 0.0168,
                                                            ),
                                                            NameTextField(
                                                              NameController: controllerName,
                                                              onSubmitted:
                                                                  (value) async {
                                                                setState(() {
                                                                  controllerName.text = value;
                                                                  box.write('Name', controllerName.text);
                                                                });
                                                              },
                                                            ),
                                                            SizedBox(
                                                              height: appHeight * 0.0168,
                                                            ),
                                                            DialogDesignBoxA(
                                                                stringNumber: stringNumber,
                                                                subwayName: subwayname,
                                                                passenger: controllerName.text),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                SizedBox(
                                                  child: GestureDetector(
                                                    child: TextButton(
                                                      onPressed: () {

                                                        box.write('subwayA',subwayname);
                                                        box.write('latA',NotifyCall.lat1);
                                                        box.write('lngA',NotifyCall.lng1);
                                                        box.write('engA',NotifyCall.engName);
                                                        box.write('lineA',stringNumber);
                                                        Fluttertoast.showToast(
                                                            msg:'목적지 ${subwayname}가 저장되었습니다.\n${NotifyCall.engName}',
                                                            gravity: ToastGravity.CENTER);
                                                      },
                                                      onLongPress: () {
                                                        box.write('subwayB',subwayname);
                                                        box.write('latB',NotifyCall.lat1);
                                                        box.write('lngB',NotifyCall.lng1);
                                                        box.write('engB',NotifyCall.engName);
                                                        box.write('lineB',stringNumber);
                                                        Fluttertoast.showToast(
                                                            msg:'목적지 ${subwayname}가 저장되었습니다.\n${NotifyCall.engName}',
                                                            gravity: ToastGravity.CENTER);
                                                      },
                                                      child: Container(
                                                        child: Text(
                                                          'Save',
                                                          style: TextStyle(
                                                              fontSize: appHeight * 0.0168,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: GestureDetector(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                        //  stringNumber = stringNumberD;
                                                          NotifyCall.findMyposition(SubwayInfo, subwayname);
                                                          Navigator.pop(context);
                                                        });

                                                      },
                                                      child: Container(
                                                        child: Text('Adapt',
                                                          style: TextStyle(
                                                              fontSize: appHeight * 0.0168,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ));
                                  },

                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Container(
                                          color: Colors.white,
                                          height: appHeight * 0.447,
                                          child: Form(
                                            child: Column(
                                              children: [
                                                DialogDesign(),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            appHeight * 0.0112,
                                                      ),
                                                      CustomWidget(
                                                        itemSubmitted: (value) {
                                                          setState(() {
                                                            subwayname = value;
                                                            NotifyCall.save_position(SubwayInfo, subwayname);

                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: appHeight * 0.0168,
                                                      ),
                                                      CustomWidget(
                                                        itemSubmitted: (value) {
                                                          setState(() {
                                                            subwaynameT = value;
                                                            box.write('subwayT', subwaynameT);
                                                            box.write('lineT', stringNumberT);
                                                          });
                                                          SecondDialog();
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: appHeight * 0.0168,
                                                      ),
                                                      NameTextField(
                                                        NameController: controllerName,
                                                        onSubmitted: (value) async {
                                                          setState(() {
                                                            controllerName.text = value;
                                                            box.write('Name', controllerName.text);
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: appHeight * 0.0168,
                                                      ),
                                                      DialogDesignBoxB(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          SizedBox(
                                            child: GestureDetector(
                                              child: TextButton(
                                                onPressed: () {
                                                  box.write('subwayA',subwayname);
                                                  box.write('latA',NotifyCall.lat1);
                                                  box.write('lngA',NotifyCall.lng1);
                                                  box.write('engA',NotifyCall.engName);
                                                  box.write('lineA',stringNumber);
                                                  Fluttertoast.showToast(
                                                      msg:'목적지 ${subwayname}가 저장되었습니다.\n${NotifyCall.engName}',
                                                      gravity: ToastGravity.CENTER);

                                                },
                                                onLongPress: () {
                                                  box.write('subwayB',subwayname);
                                                  box.write('latB',NotifyCall.lat1);
                                                  box.write('lngB',NotifyCall.lng1);
                                                  box.write('engB',NotifyCall.engName);
                                                  box.write('lineB',stringNumber);
                                                  Fluttertoast.showToast(
                                                      msg:'목적지 ${subwayname}가 저장되었습니다.\n${NotifyCall.engName}',
                                                      gravity: ToastGravity.CENTER);

                                                },
                                                child: Container(
                                                  child: Text('Save',
                                                    style: TextStyle(
                                                        fontSize: appHeight * 0.0168,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            child: GestureDetector(
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                  //  stringNumber = stringNumberD;
                                                    NotifyCall.findMyposition(SubwayInfo, subwayname);
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Container(
                                                  child: Text('Adapt', style: TextStyle(
                                                        fontSize: appHeight * 0.0168,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: appHeight / 6,
                                    child: Icon(
                                      Icons.subway,
                                      size: mainBoxHeight / 7,
                                    ),
                                  ),
                                ),
                                SizedBox(height: mainBoxHeight / 20,),
                                TextContainerA(StringNumber: stringNumber,),
                                Container(
                                  color: Colors.transparent,
                                  width: appHeight * 0.224,
                                  height: appHeight * 0.056,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        color: Colors.transparent,
                                        width: appHeight * 0.132,
                                        height: appHeight * 0.056,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: ConvertDirection == true ? Colors.white : Colors.grey[350],
                                            ),
                                            width: appHeight * 0.036,
                                            height: appHeight * 0.04,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  ConvertDirection = false;
                                                  Direction = '상행';
                                                });
                                              },
                                              onDoubleTap: (){
                                                ConvertDirection = false;
                                                Direction = '상행';
                                                Fluttertoast.showToast(
                                                    msg:'상행 열차 시간표',
                                                    gravity: ToastGravity.CENTER);
                                              },
                                              child: Icon(
                                                Icons.keyboard_double_arrow_up,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: ConvertDirection == false ? Colors.white : Colors.grey[350],
                                            ),
                                            width: appHeight * 0.036,
                                            height: appHeight * 0.04,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  ConvertDirection = true;
                                                  Direction = '하행';
                                                });
                                              },
                                              onDoubleTap: (){
                                                ConvertDirection = true;
                                                Direction = '하행';
                                                Fluttertoast.showToast(
                                                    msg:'하행 열차 시간표',
                                                    gravity: ToastGravity.CENTER);
                                              },
                                              child: Icon(
                                                Icons.keyboard_double_arrow_down,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                TextContainerB(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ToggleSwitch(
                            minWidth: 40.0,
                            minHeight: 25.0,
                            fontSize: 15.0,
                            totalSwitches: 3,
                            initialLabelIndex: null,
                            doubleTapDisable: true,
                            activeBgColor: [Colors.grey.shade600],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey[200],
                            inactiveFgColor: Colors.black,
                            customIcons: [
                              const Icon(Icons.keyboard_double_arrow_right, // color: Colors.black,
                                size: 20.0,
                              ),
                              const Icon(Icons.u_turn_left_sharp,
                                  size: 20.0,),
                              const Icon(Icons.keyboard_double_arrow_left, // color: Colors.black,
                                size: 20.0,
                              ),
                            ],
                            onToggle: (index) {
                              if (index == 0) {
                                convertor(index!);
                                print('showTable is ${showTable}');
                                setState(() {
                                var subwayA = box.read('subwayA');
                                var latA = box.read('latA');
                                var lngA = box.read('lngA');
                                var engA = box.read('engA');
                                var lineA = box.read('lineA');
                                Fluttertoast.showToast(
                                    msg:'목적지 ${subwayA}로 출발합니다.\n위치 추적을 시작합니다.',
                                    gravity: ToastGravity.CENTER)
                                    .then((value) => NotifyCall.subwayName = subwayA)
                                    .then((value) => NotifyCall.engName = engA)
                                    .then((value) => stringNumber = lineA)
                                    .then((value) =>NotifyCall.lat1 = latA)
                                    .then((value) =>NotifyCall.lng1 = lngA)
                                    .then((value) => print('${NotifyCall.subwayName}${stringNumber}\n${NotifyCall.lat1}__${NotifyCall.lng1}'));

                                });

                              } else if (index == 1) {
                                convertor(index!);
                                print('Transfer is ${showTable}');
                                setState(() {
                                 var subwayT = box.read('subwayT');
                                 var lineT = box.read('lineT');
                                 timerSnackbar(
                                     context: context,
                                     contentText: '${lineT} ${subwayT} 에 대한 정보\n\n상행 당고개 서울역[2전]\n상행 진접 성신여대 [4전]\n\n하행 사당 혜화역 [2역전]\n하행 오이도 12분 14초후',
                                     afterTimeExecute: () => print("Operation Execute."),
                                   second: 5,
                                 );
                                });

                              } else if (index == 2) {
                                convertor(index!);
                                print('showTable is ${showTable}');
                                setState(() {
                                var subwayB = box.read('subwayB');
                                var latB =  box.read('latB');
                                var lngB =  box.read('lngB');
                                var engB =  box.read('engB');
                                var lineB =   box.read('lineB');
                                Fluttertoast.showToast(
                                    msg:'목적지 ${subwayB}로 출발합니다.\n위치 추적을 시작합니다.',
                                    gravity: ToastGravity.CENTER)
                                    .then((value) => NotifyCall.subwayName = subwayB)
                                    .then((value) => NotifyCall.engName = engB)
                                    .then((value) => stringNumber = lineB)
                                    .then((value) =>NotifyCall.lat1 = latB)
                                    .then((value) =>NotifyCall.lng1 = lngB)
                                    .then((value) => print('${NotifyCall.subwayName}${stringNumber}\n${NotifyCall.lat1}__${NotifyCall.lng1}'));
                                });
                              } else {
                                print('showTable is ${showTable}');
                              }
                            },
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          minHeight: appHeight * 0.135,
          maxHeight: appHeight * 0.72,
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0))
          ],
          panelBuilder: (controller) => secondpage( controller: controller,
          ),
        ),
      ),
    );
  }
}
