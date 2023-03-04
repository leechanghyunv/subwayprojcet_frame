import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../Model/table_model.dart';
import 'package:http/http.dart' as http;
import '../Tool&Controller/getx_api.dart';
import '../Tool&Controller/getx_controller.dart';
import '../Tool&Controller/getx_convert.dart';
import '../Tool&Controller/notification.dart';
import 'mainpage.dart';


class left_table extends StatefulWidget {

  @override
  State<left_table> createState() => _left_tableState();
}

class _left_tableState extends State<left_table> {

  String Time =  DateFormat('HH:mm:ss').format(DateTime.now());

  ScrollController _scrollControllerA = ScrollController();
  ScrollController _scrollControllerB = ScrollController();
  final NotifyCall = Get.put(GetX_Notification());
  final Convert_Type = Get.put(Inter_Changer());
  final Api_Upside = Get.put(SubwayDataControllerU());
  final Api_Downside = Get.put(SubwayDataControllerD());
  late List<RowA> _timeTableRowsA = [];
  late List<RowA> _timeTableRowsB = [];

  String Name = '';
  int Code = 0;
  String StringLine = '';
  String CodeResult = '';
  String LineColor = '';
  bool time_table = true;

  static String key = '4c6f72784b6272613735677166456d';

  Future<void> getTimeTableDataA(String code) async {
    try{
      var response = await http.get(Uri.parse(
          'http://openAPI.seoul.go.kr:8088/${key}/json/SearchSTNTimeTableByIDService/1/500/${code}/1/1/'));
      var timeTable = timeTableFromJson(response.body);
      setState(() {
        _timeTableRowsA = timeTable.searchStnTimeTableByIdService.row;
      });
    }catch(e){
      print('Error???');
    }
  }

  Future<void> getTimeTableDataB(String code) async {
    try{
      var response = await http.get(Uri.parse(
          'http://openAPI.seoul.go.kr:8088/${key}/json/SearchSTNTimeTableByIDService/1/500/${code}/1/2/'));
      var timeTable = timeTableFromJson(response.body);
      setState(() {
        _timeTableRowsB = timeTable.searchStnTimeTableByIdService.row;
      });
    }catch(e){
      print('Error???');
    }
  }

  @override
  void initState() {
    time_table = false;
    getTimeTableDataA(box.read('codeB'));
    getTimeTableDataB(box.read('codeB'));
    Api_Upside.GetInfoU(box.read('subwayB'), box.read('line_to_NumB'), '상행');
    Api_Downside.GetInfoD(box.read('subwayB'), box.read('line_to_NumB'), '하행');
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    return Scaffold(
      body: Container(
            color: Colors.white,
            height: appHeight * 0.9,
            width: appWidth,
                 child: Row(
                   children: [
                     Column(
                       children: [
                         Container(
                           width: appWidth * 0.5,
                           height: appHeight * 0.05,
                           color: Colors.grey[300],
                           alignment: Alignment.center,

                             child: Text(time_table == true
                                 ? '${Api_Upside.TerminalArriving}'
                                 : '${Api_Upside.TerminalArriving}',
                               style: TextStyle(color: Colors.black),
                             ),

                         ),
                         Container(

                           width: appWidth * 0.5,
                           height: appHeight * 0.45,
                           child: ListView.builder(
                             controller: _scrollControllerA,
                             itemCount: _timeTableRowsA.length,
                             itemBuilder: (context, index) {
                               var row = _timeTableRowsA[index];
                               return ListTile(
                              // leading: Icon(Icons.view_timeline,size: 10,),
                                 title: Row(
                                   children: [
                                    Text('${row.subwaysname}행 < ${row.subwayename}',
                                         style: TextStyle(fontSize: 12.5)
                                         ,overflow: TextOverflow.ellipsis,),
                                   ],
                                 ),
                                 trailing: Text(
                                     '${row.arrivetime}',style: TextStyle(fontSize: 12.5),),
                               );
                             },
                           ),
                         ),
                         Expanded(
                           child: Container(
                             alignment: Alignment.centerLeft,
                             color: Colors.grey[400],
                             width: appWidth/2,
                             child: Row(
                               children: [
                                 SizedBox(width: 20,),
                               Text(Time),
                             ],),
                           ),
                         ),
                       ],
                     ),
                     Column(
                       children: [
                         Container(
                           width: appWidth * 0.5,
                           height: appHeight * 0.05,
                           color: Colors.white,
                           alignment: Alignment.center,
                           // Api_Upside.TerminalArriving
                             child: Text(time_table == true
                                 ? '${Api_Upside.TerminalArriving}'
                                 : '${Api_Upside.TerminalArriving}',
                               style: TextStyle(color: Colors.black),
                             ),
                         ),
                         Container(
                           decoration: BoxDecoration(
                             color: Colors.grey[300],
                             // border: Border.all(width: 0.1
                             // ),
                           ),
                           width: appWidth * 0.5,
                           height: appHeight * 0.45,
                           child: ListView.builder(
                             controller: _scrollControllerB,
                             itemCount: _timeTableRowsB.length,
                             itemBuilder: (context, index) {
                               var row = _timeTableRowsB[index];
                               return ListTile(
                                 // leading: Icon(Icons.view_timeline),
                                 title: Row(
                                   children: [
                                   Text('${row.subwaysname}행 < ${row.subwayename}',
                                           style: TextStyle(fontSize: 12.5),
                                           overflow: TextOverflow.ellipsis),
                                   ],
                                 ),
                                 trailing: Text(
                                   '${row.arrivetime}',style: TextStyle(fontSize: 12.5),),
                               );
                             },
                           ),
                         ),
                         Expanded(
                           child: Container(
                             alignment: Alignment.center,
                             color: Colors.grey[400],
                             width: appWidth/2,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 IconButton(onPressed: (){
                                   setState(() {
                                     time_table = true;
                                     getTimeTableDataA(box.read('codeA'));
                                     getTimeTableDataB(box.read('codeA'));
                                     Api_Upside.GetInfoU(box.read('subwayA'), box.read('line_to_NumA'), '상행');
                                     Api_Downside.GetInfoD(box.read('subwayA'), box.read('line_to_NumA'), '하행');
                                     Fluttertoast.showToast(
                                         msg:'${box.read('lineA')} ${box.read('subwayA')}역',
                                         gravity: ToastGravity.CENTER);
                                     print(box.read('codeA'));
                                   });
                                 }, icon: Icon(Icons.circle_outlined,
                                   color: Colors.grey[600],)),

                                 IconButton(onPressed: (){
                                   setState(() {
                                     time_table = false;
                                     getTimeTableDataA(box.read('codeB'));
                                     getTimeTableDataB(box.read('codeB'));
                                     Api_Upside.GetInfoU(box.read('subwayB'), box.read('line_to_NumB'), '상행');
                                     Api_Downside.GetInfoD(box.read('subwayB'), box.read('line_to_NumB'), '하행');
                                     Fluttertoast.showToast(
                                         msg:'${box.read('lineB')} ${box.read('subwayB')}역',
                                         gravity: ToastGravity.CENTER);
                                     print(box.read('codeB'));
                                   });
                                 }, icon: Icon(Icons.circle_outlined,
                                   color: Colors.grey[500],)),

                                 SizedBox(width: 20,),
                                 // IconButton(
                                 //   onPressed: (){
                                 //   Navigator.pop(context);
                                 // }, icon: Icon(Icons.circle),
                                 //   color: Colors.white30,),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
          ),
    );
  }
}
