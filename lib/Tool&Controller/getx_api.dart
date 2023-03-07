import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../Model/subway_api_model.dart';

class SubwayDataControllerU extends GetxController {

  SubwayApi? subwaydata = SubwayApi();
  String? StringLine ='';
  String? UpandDown = '';
  String? Direction = '';
  String? Type = '';
  String? Terminal ='';
  String? Arriving1 = '';
  String? Code = '';
  String? TrainNumber = '';
  String? TerminalArriving ='';
  String? key = '4c6f72784b6272613735677166456d';

  Future<SubwayApi?> GetInfoU(String subwayName1, LineNumber,  UpDown) async{
    String Url = 'http://swopenapi.seoul.go.kr/api/subway/${key}/json/realtimeStationArrival/0/16/${subwayName1}';
    try{
      final response = await http.get(Uri.parse(Url));
      print(response.statusCode);
      if(response.statusCode == 200){
        Map<String, dynamic> subwayMap = jsonDecode(response.body);
        var subway = SubwayApi.fromJson(subwayMap);
        if(LineNumber == '1002' && UpDown == '상행'){
          UpDown = '내선';
        }else if(LineNumber == '1002' && UpDown == '하행'){
          UpDown = '외선';
        }

        final index = subway.realtimeArrivalList?.indexWhere((element)
        => element?.subwayId == LineNumber && element?.updnLine == UpDown);

        Direction = subway.realtimeArrivalList?[index!]?.subwayHeading; // 오른쪽,왼쪽 // 내리는방향기준
       Type = subway.realtimeArrivalList?[index!]?.btrainSttus; // ITX, 급행
       Terminal = subway.realtimeArrivalList?[index!]?.bstatnNm; // 종착
       Arriving1 = subway.realtimeArrivalList?[index!]?.arvlMsg2; // 도착메시지

       Code = subway.realtimeArrivalList?[index!]?.arvlCd; //
       TrainNumber = subway.realtimeArrivalList?[index!]?.btrainNo; // 열차번호
       TerminalArriving = subway.realtimeArrivalList?[index!]?.trainLineNm; // "방화행 - 마장방면",
        return subway;
      }else{
        print('Error occured1');
      }
    }catch(e){
      print('Error occured2');
    }
  }
}

class SubwayDataControllerD  extends GetxController {

  SubwayApi? subwaydata = SubwayApi();
  String? StringLine ='';
  String? UpandDown = '';
  String? Direction = '';
  String? Type = '';
  String? Terminal ='';
  String? Arriving1 = '';
  String? Code = '';
  String? TrainNumber = '';
  String? TerminalArriving ='';
  String? key = '4c6f72784b6272613735677166456d';

  Future<SubwayApi?> GetInfoD(String subwayName1, LineNumber, String UpDown) async{
    String Url = 'http://swopenapi.seoul.go.kr/api/subway/${key}/json/realtimeStationArrival/0/16/${subwayName1}';
    try{
      final response = await http.get(Uri.parse(Url));
      print(response.statusCode);
      if(response.statusCode == 200){
        Map<String, dynamic> subwayMap = jsonDecode(response.body);
        var subway = SubwayApi.fromJson(subwayMap);
        if(LineNumber == '1002' && UpDown == '상행'){
          UpDown = '내선';
        }else if(LineNumber == '1002' && UpDown == '하행'){
          UpDown = '외선';
        }

        final index = subway.realtimeArrivalList?.indexWhere((element)
        => element?.subwayId == LineNumber && element?.updnLine == UpDown);
        Direction = subway.realtimeArrivalList?[index!]?.subwayHeading; // 오른쪽,왼쪽 // 내리는방향기준
        Type = subway.realtimeArrivalList?[index!]?.btrainSttus; // ITX, 급행
        Terminal = subway.realtimeArrivalList?[index!]?.bstatnNm; // 종착
        Arriving1 = subway.realtimeArrivalList?[index!]?.arvlMsg2; // 도착메시지
        Code=subway.realtimeArrivalList?[index!]?.arvlCd; // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
        TrainNumber = subway.realtimeArrivalList?[index!]?.btrainNo; // 열차번호
        TerminalArriving = subway.realtimeArrivalList?[index!]?.trainLineNm; // "방화행 - 마장방면",
        return subway;

      }else{
        print('Error occured1');
      }
    }catch(e){
      print('Error occured2');
    }
  }
}

class SubwayDataControllerUT  extends GetxController {

  SubwayApi? subwaydata = SubwayApi();
  String? StringLine ='';
  String? UpandDown = '';
  String? Direction = '';
  String? Type = '';
  String? Terminal ='';
  String? Arriving1 = '';
  String? Code = '';
  String? TrainNumber = '';
  String? TerminalArriving ='';
  String? key = '4c6f72784b6272613735677166456d';

  Future<SubwayApi?> GetInfoT(String subwayName1, LineNumber, String UpDown) async{
    String Url = 'http://swopenapi.seoul.go.kr/api/subway/${key}/json/realtimeStationArrival/0/16/${subwayName1}';
    try{
      final response = await http.get(Uri.parse(Url));
      print(response.statusCode);
      if(response.statusCode == 200){
        Map<String, dynamic> subwayMap = jsonDecode(response.body);
        var subway = SubwayApi.fromJson(subwayMap);
        if(LineNumber == '1002' && UpDown == '상행'){
          UpDown = '내선';
        }else if(LineNumber == '1002' && UpDown == '하행'){
          UpDown = '외선';
        }

        final index = subway.realtimeArrivalList?.indexWhere((element)
        => element?.subwayId == LineNumber && element?.updnLine == UpDown);
        Direction = subway.realtimeArrivalList?[index!]?.subwayHeading; // 오른쪽,왼쪽 // 내리는방향기준
        Type = subway.realtimeArrivalList?[index!]?.btrainSttus; // ITX, 급행
        Terminal = subway.realtimeArrivalList?[index!]?.bstatnNm; // 종착
        Arriving1 = subway.realtimeArrivalList?[index!]?.arvlMsg2; // 도착메시지
        Code=subway.realtimeArrivalList?[index!]?.arvlCd; // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
        TrainNumber = subway.realtimeArrivalList?[index!]?.btrainNo; // 열차번호
        TerminalArriving = subway.realtimeArrivalList?[index!]?.trainLineNm; // "방화행 - 마장방면",
        return subway;

      }else{
        print('Error occured1');
      }
    }catch(e){
      print('Error occured2');
    }
  }
}

class SubwayDataControllerDT  extends GetxController {

  SubwayApi? subwaydata = SubwayApi();
  String? StringLine ='';
  String? UpandDown = '';
  String? Direction = '';
  String? Type = '';
  String? Terminal ='';
  String? Arriving1 = '';
  String? Code = '';
  String? TrainNumber = '';
  String? TerminalArriving ='';
  String? key = '4c6f72784b6272613735677166456d';

  Future<SubwayApi?> GetInfoT(String subwayName1, LineNumber, String UpDown) async{
    String Url = 'http://swopenapi.seoul.go.kr/api/subway/${key}/json/realtimeStationArrival/0/16/${subwayName1}';
    try{
      final response = await http.get(Uri.parse(Url));
      print(response.statusCode);
      if(response.statusCode == 200){
        Map<String, dynamic> subwayMap = jsonDecode(response.body);
        var subway = SubwayApi.fromJson(subwayMap);
        if(LineNumber == '1002' && UpDown == '상행'){
          UpDown = '내선';
        }else if(LineNumber == '1002' && UpDown == '하행'){
          UpDown = '외선';
        }

        final index = subway.realtimeArrivalList?.indexWhere((element)
        => element?.subwayId == LineNumber && element?.updnLine == UpDown);
        Direction = subway.realtimeArrivalList?[index!]?.subwayHeading; // 오른쪽,왼쪽 // 내리는방향기준
        Type = subway.realtimeArrivalList?[index!]?.btrainSttus; // ITX, 급행
        Terminal = subway.realtimeArrivalList?[index!]?.bstatnNm; // 종착
        Arriving1 = subway.realtimeArrivalList?[index!]?.arvlMsg2; // 도착메시지
        Code=subway.realtimeArrivalList?[index!]?.arvlCd; // (0:진입, 1:도착, 2:출발, 3:전역출발, 4:전역진입, 5:전역도착, 99:운행중)
        TrainNumber = subway.realtimeArrivalList?[index!]?.btrainNo; // 열차번호
        TerminalArriving = subway.realtimeArrivalList?[index!]?.trainLineNm; // "방화행 - 마장방면",
        return subway;

      }else{
        print('Error occured1');
      }
    }catch(e){
      print('Error occured2');
    }
  }
}