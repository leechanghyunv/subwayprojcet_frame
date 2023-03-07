import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subway_project_230208/Part/qr_container.dart';
import '../Model/model.dart';
import '../Part/LAFAYETTE.dart';
import '../Part/colorcontainer.dart';
import '../Part/design_text.dart';
import '../Part/design_text2.dart';
import '../Part/dialog_designbox1.dart';
import '../Part/dialog_designbox2.dart';
import '../Part/dialog_designbox3.dart';
import '../Part/main_text.dart';
import '../Part/qr_container2.dart';
import '../Part/sms_container.dart';
import '../Part/topdesign.dart';
import '../Tool&Controller/Url_launcher.dart';
import '../Tool&Controller/csv_code.dart';
import '../Tool&Controller/geolocation.dart';
import '../Tool&Controller/getx_api.dart';
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
import 'secondpage.dart';

final box = GetStorage();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String stringNumber = 'Line2';
  late String stringNumberT = 'Line2';
  late String subwayname = 'SEOUL';
  late String subwaynameT = '서울';
  late String Line_to_Id = '';
  late String Line_to_Id_T = '';
  late String TEST = '';
  String subwayA = '', subwayB = '', subwayT = '';
  double latA = 0.0, latB = 0.0;
  double lngA = 0.0, lngB = 0.0;
  String engA = '', engB = '';
  String lineA = '', lineB = '', lineT = '';
  String line_to_NumA = '', line_to_NumB = '', line_to_NumT = '';

  int _currentValue = 0;
  int _secondValue = 0;

  int Code = 0;
  String CodeResult = '';

  late bool ConvertDirection = false;
  late String Direction = '상행';

  TextEditingController controllerName = TextEditingController();

  final NotifyCall = Get.put(GetX_Notification());
  final Convert_Type = Get.put(Inter_Changer());
  final Api_Upside = Get.put(SubwayDataControllerU());
  final Api_Downside = Get.put(SubwayDataControllerD());
  final Api_UpsideT = Get.put(SubwayDataControllerUT());
  final Api_DownsideT = Get.put(SubwayDataControllerDT());
  final Get_Code = Get.put(get_code());

  Future<void> OpenDialog() async {
    showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(builder: (context, setState) {
              return NumberPickerDialog(
                value: _currentValue,
                onChanged: (value) => setState(() {
                    _currentValue = value;
                    Convert_Type.convertLine(_currentValue);
                    stringNumber = Convert_Type.subway_line;
                    Convert_Type.convertLine_to_ID(stringNumber);
                    Line_to_Id = Convert_Type.line_number;
                }),
              );
            }),
            actions: [
              Column(
                children: [
                  TextButton(
                    child: Text("Done", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    onPressed: () {
                      Get_Code.Get_code(subwayname, stringNumber);
                      Navigator.of(context).pop();
                    }
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
                    Convert_Type.convertLine(_currentValue);
                    stringNumber = Convert_Type.subway_line;
                    Convert_Type.convertLine_to_ID(stringNumber);
                    Line_to_Id = Convert_Type.line_number;
                }),
                value2: _secondValue,
                onChanged2: (value) => setState(() {
                    _secondValue = value;
                    Convert_Type.convertLine(_currentValue);
                    stringNumberT = Convert_Type.subway_line;
                    Convert_Type.convertLine_to_ID(stringNumberT);
                    Line_to_Id_T = Convert_Type.line_number;
                }),
              );
            }),
            actions: [
              Column(
                children: [
                  TextButton(
                    child: Text("Done", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    onPressed: (){
                      Get_Code.Get_code(subwayname, stringNumber);
                      // Get_Code.Get_code(subwaynameT, stringNumberT);
                      Navigator.of(context).pop();
                    }
                  ),
                ],
              )
            ],
          );
        });
  }

  @override
  void initState() {
    GetGeoLocationData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;/// 520   ~ 519.68
  //           maxHeight: appHeight * 0.72, /// 0.72
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

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
                                SizedBox(height: mainBoxHeight / 20,
                                ),
                                SizedBox(
                                  height: appHeight * 0.58 * 0.90,
                                  width: appWidth * 0.08,
                                  child: ColorContainer(StringNumber: stringNumber),
                                ),
                              ],
                            ),
                            SizedBox(width: mainBoxHeight / 50,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(height: mainBoxHeight / 25,
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
                                                            SizedBox(height: appHeight * 0.0112,
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
                                                            SizedBox( height: appHeight * 0.0168,
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
                                                            SizedBox( height: appHeight * 0.0168,
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
                                                        box.write('line_to_NumA',Line_to_Id);
                                                        box.write('codeA',Get_Code.CodeResult);
                                                        box.write('convertA',Get_Code.Converted_line);
                                                        print('코드 결과는 ${box.read('codeA')}');

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
                                                        box.write('line_to_NumB',Line_to_Id);
                                                        box.write('codeB',Get_Code.CodeResult);
                                                        box.write('convertB',Get_Code.Converted_line);
                                                        print(box.read('codeB'));
                                                        Fluttertoast.showToast(
                                                            msg:'목적지 ${subwayname}가 저장되었습니다.\n${NotifyCall.engName}',
                                                            gravity: ToastGravity.CENTER);
                                                      },
                                                      child: Container(
                                                        child: Text( 'Save', style: TextStyle(
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
                                                        height: appHeight * 0.0112,
                                                      ),
                                                      CustomWidget(
                                                        itemSubmitted: (value) {
                                                          setState(() {
                                                            subwayname = value;
                                                            NotifyCall.save_position(SubwayInfo, subwayname);
                                                          });
                                                        },
                                                      ),
                                                      SizedBox( height: appHeight * 0.0168,
                                                      ),
                                                      CustomWidget(
                                                        itemSubmitted: (value) {
                                                          setState(() {
                                                            subwaynameT = value;
                                                            box.write('subwayT', subwaynameT);
                                                            box.write('lineT', stringNumberT);
                                                            box.write('line_to_NumT',Line_to_Id_T);
                                                            // NotifyCall.findMyposition(SubwayInfo, subwaynameT);
                                                          });
                                                          SecondDialog();
                                                        },
                                                      ),
                                                      SizedBox( height: appHeight * 0.0168,
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
                                                      SizedBox( height: appHeight * 0.0168,
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
                                                  box.write('line_to_NumA',Line_to_Id);
                                                  box.write('codeA',Get_Code.CodeResult);
                                                  box.read('codeA');
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
                                                  box.write('line_to_NumB',Line_to_Id);
                                                  box.write('codeB',Get_Code.CodeResult);
                                                  box.read('codeB');
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
                                              onTap: () async {
                                                await Api_Upside.GetInfoU(box.read('subwayB'), box.read('line_to_NumB'), '상행');
                                                await Api_Downside.GetInfoD(box.read('subwayB'), box.read('line_to_NumB'), '하행').
                                                then((value) => timerSnackbar(
                                                  context: context,
                                                  contentText: '출발역 ${box.read('convertB')} ${box.read('subwayB')} \n\n${Api_Upside.TerminalArriving} -- ${Api_Upside.Arriving1}\n\n${Api_Downside.TerminalArriving} -- ${Api_Downside.Arriving1}',
                                                  afterTimeExecute: () => print("Operation Execute."),
                                                  second: 5,
                                                ));
                                                setState(() {
                                                  ConvertDirection = false;
                                                  Direction = '상행';
                                                });
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
                                              onTap: () async {
                                                await Api_Upside.GetInfoU(box.read('subwayA'), box.read('line_to_NumA'), '상행');
                                                await Api_Downside.GetInfoD(box.read('subwayA'), box.read('line_to_NumA'), '하행').
                                                then((value) =>  timerSnackbar(
                                                  context: context,
                                                  contentText: '출발역 ${box.read('convertA')} ${box.read('subwayA')} \n\n${Api_Upside.TerminalArriving} -- ${Api_Upside.Arriving1}\n\n${Api_Downside.TerminalArriving} -- ${Api_Downside.Arriving1}',
                                                  afterTimeExecute: () => print("Operation Execute."),
                                                  second: 5,
                                                ));
                                                setState(() {
                                                  ConvertDirection = true;
                                                  Direction = '하행';
                                                });
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
                                Convert_Type.showtable_updown = true;
                                print('Convert_Type.showtable_updown : ${Convert_Type.showtable_updown}');
                                Convert_Type.convertor(index!);
                                print('showTable is ${Convert_Type.showTable}');
                                print('토글 버튼을 눌렀을때 코드는  ${box.read('codeA')}');
                                setState(() {
                                  Fluttertoast.showToast(
                                    msg:'목적지 ${box.read('subwayA') ?? 'SEOUL'}로 출발합니다.\n위치 추적을 시작합니다.',
                                    gravity: ToastGravity.CENTER)
                                    .then((value) => NotifyCall.subwayName = box.read('subwayA'))
                                    .then((value) => NotifyCall.engName = box.read('engA'))
                                    .then((value) => stringNumber = box.read('lineA'))
                                    .then((value) =>NotifyCall.lat1 = box.read('latA'))
                                    .then((value) =>NotifyCall.lng1 = box.read('lngA'))
                                    .then((value) => print('${NotifyCall.subwayName}${stringNumber}\n${NotifyCall.lat1}__${NotifyCall.lng1}'));
                                }
                                );
                              } else if (index == 1) {
                                Convert_Type.convertor(index!);
                                print('Transfer is ${Convert_Type.showTable}');
                                print('환승역인 ${box.read('subwayT')}의 상하행 시간표');
                                setState(()  {
                                  Api_UpsideT.GetInfoT(box.read('subwayT'), box.read('line_to_NumT'), '상행');
                                  Api_DownsideT.GetInfoT(box.read('subwayT'), box.read('line_to_NumT'), '하행');
                                 timerSnackbar(
                                     context: context,
                                     contentText: '환승역 ${box.read('subwayT')} \n\n${Api_Upside.TerminalArriving} -- ${Api_Upside.Arriving1}\n\n${Api_Downside.TerminalArriving} -- ${Api_Downside.Arriving1}',
                                     afterTimeExecute: () => print("Operation Execute."),
                                   second: 5,
                                 );
                                });
                              } else if (index == 2) {
                                Convert_Type.showtable_updown = false;
                                print('Convert_Type.showtable_updown : ${Convert_Type.showtable_updown}');
                                Convert_Type.convertor(index!);
                                print('showTable is ${Convert_Type.showTable}');
                                print('토글 버튼을 눌렀을때 코드는  ${box.read('codeB')}');
                                setState(()  {
                                  Fluttertoast.showToast(
                                    msg:'목적지 ${box.read('subwayB')}로 출발합니다.\n위치 추적을 시작합니다.',
                                    gravity: ToastGravity.CENTER)
                                    .then((value) => NotifyCall.subwayName = box.read('subwayB'))
                                    .then((value) => NotifyCall.engName = box.read('engB'))
                                    .then((value) => stringNumber = box.read('lineB'))
                                    .then((value) =>NotifyCall.lat1 = box.read('latB'))
                                    .then((value) =>NotifyCall.lng1 = box.read('lngB'))
                                    .then((value) => print('${NotifyCall.subwayName}${stringNumber}\n${NotifyCall.lat1}__${NotifyCall.lng1}'));
                                });
                              } else {
                                print('showTable is ${Convert_Type.showTable}');
                              }
                            },
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),

                    ],
                  ),
                ),

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
                        child: LoadingAnimationWidget.hexagonDots(
                          color: NotifyCall.loading == true? Colors.white : Colors.black38,
                          size: 20,
                        ),
                      ),
                      Lafayette(),
                      AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onLongPress: () {
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
                                            child: sms_container(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DialogDesignBox3( stringNumber: stringNumber, subwayName: NotifyCall.subwayName),
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
                                        child: SMS_function(subwayline: stringNumber,),
                                      ),
                                    ],
                                  ));
                            },
                            onTap: (){
                              showModalBottomSheet(
                                  context: context,
                                  enableDrag: true,
                                  isScrollControlled: false,
                                  builder: (_){
                                    return left_table();
                                  });
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
              ],
            ),
          ),
          ),
    );
  }
}
