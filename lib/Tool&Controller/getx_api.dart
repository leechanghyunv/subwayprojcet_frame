// import 'dart:convert';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
// import '../Model/subway_api_model.dart';
//
//
// class SubwayDataControllerD2  extends GetxController {
//
//   SubwayApi? subwaydata = SubwayApi();
//   String? StringLine ='';
//   String? UpandDown = '';
//   String? Direction = '';
//   String? Type = '';
//   String? Terminal ='';
//   String? Line ='';
//   String? Arriving1 = '';
//   String? Arriving2 = '';
//   String? Code = '';
//   String? TrainNumber = '';
//   String? TerminalArriving ='';
//
//
//   Future<SubwayApi?> GetInfoD2(String subwayName1, LineNumber, String UpDown) async{
//     String Url = 'http://swopenapi.seoul.go.kr/api/subway/4c6f72784b6272613735677166456d/json/realtimeStationArrival/0/16/${subwayName1}';
//     try{
//       final response = await http.get(Uri.parse(Url));
//       print(response.statusCode);
//       if(response.statusCode == 200){
//         Map<String, dynamic> subwayMap = jsonDecode(response.body);
//         var subway = SubwayApi.fromJson(subwayMap);
//         print('타입은===>>> ${subway}');
//
//         if(LineNumber == 'Line2' && UpDown == '상행'){
//           UpDown = '내선';
//         }else if(LineNumber == 'Line2' && UpDown == '하행'){
//           UpDown = '외선';
//         }
//
//         final index = subway.realtimeArrivalList?.indexWhere((element)
//         => element?.subwayId == StringLine && element?.updnLine == UpDown);
//
//         Direction = subway.realtimeArrivalList?[index!]?.subwayHeading; // 오른쪽,왼쪽 // 내리는방향기준
//         Type = subway.realtimeArrivalList?[index!]?.btrainSttus; // ITX, 급행
//         Terminal =subway.realtimeArrivalList?[index!]?.bstatnNm; // 종착
//         Arriving1=subway.realtimeArrivalList?[index!]?.arvlMsg2; // 도착메시지
//         Arriving2=subway.realtimeArrivalList?[index!]?.arvlMsg3; // 도착메시지
//         Code=subway.realtimeArrivalList?[index!]?.arvlCd; //
//         // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
//         TrainNumber==subway.realtimeArrivalList?[index!]?.btrainNo; // 열차번호
//         TerminalArriving=subway.realtimeArrivalList?[index!]?.trainLineNm; // "방화행 - 마장방면",
//
//         return subway;
//
//       }else{
//         print('Error occured1');
//       }
//     }catch(e){
//       print('Error occured2');
//     }
//   }
// }
//
// class SubwayDataControllerD3  extends GetxController {
//
//   SubwayApi? subwaydata = SubwayApi();
//   String? StringLine ='';
//   String? UpandDown = '';
//   String? Direction = '';
//   String? Type = '';
//   String? Terminal ='';
//   String? Line ='';
//   String? Arriving1 = '';
//   String? Arriving2 = '';
//   String? Code = '';
//   String? TrainNumber = '';
//   String? TerminalArriving ='';
//
//
//   Future<SubwayApi?> GetInfoD3(String subwayName1, LineNumber, String UpDown) async{
//     String Url = 'http://swopenapi.seoul.go.kr/api/subway/4c6f72784b6272613735677166456d/json/realtimeStationArrival/0/16/${subwayName1}';
//     try{
//       final response = await http.get(Uri.parse(Url));
//       print(response.statusCode);
//       if(response.statusCode == 200){
//         Map<String, dynamic> subwayMap = jsonDecode(response.body);
//         var subway = SubwayApi.fromJson(subwayMap);
//         print('타입은===>>> ${subway}');
//
//         if(LineNumber == 'Line2' && UpDown == '상행'){
//           UpDown = '내선';
//         }else if(LineNumber == 'Line2' && UpDown == '하행'){
//           UpDown = '외선';
//         }
//
//         final index = subway.realtimeArrivalList?.indexWhere((element)
//         => element?.subwayId == StringLine && element?.updnLine == UpDown);
//
//         Direction = subway.realtimeArrivalList?[index!]?.subwayHeading; // 오른쪽,왼쪽 // 내리는방향기준
//         Type = subway.realtimeArrivalList?[index!]?.btrainSttus; // ITX, 급행
//         Terminal =subway.realtimeArrivalList?[index!]?.bstatnNm; // 종착
//         Arriving1=subway.realtimeArrivalList?[index!]?.arvlMsg2; // 도착메시지
//         Arriving2=subway.realtimeArrivalList?[index!]?.arvlMsg3; // 도착메시지
//         Code=subway.realtimeArrivalList?[index!]?.arvlCd; //
//         // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
//         TrainNumber==subway.realtimeArrivalList?[index!]?.btrainNo; // 열차번호
//         TerminalArriving=subway.realtimeArrivalList?[index!]?.trainLineNm; // "방화행 - 마장방면",
//         return subway;
//
//       }else{
//         print('Error occured1');
//       }
//     }catch(e){
//       print('Error occured2');
//     }
//   }
// }