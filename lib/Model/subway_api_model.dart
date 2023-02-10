import 'dart:convert';

class SubwayApi {

  final ErrorMessage? errorMessage;
  final List<RealtimeArrivalList?>? realtimeArrivalList;

  SubwayApi({this.errorMessage, this.realtimeArrivalList,});

  factory SubwayApi.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['realtimeArrivalList'] as List;
    print(list.runtimeType);
    List<RealtimeArrivalList> realtimeArrivalListList = list.map((i) => RealtimeArrivalList.fromJson(i)).toList();
    return SubwayApi(
        errorMessage: ErrorMessage.fromJson(parsedJson["errorMessage"]),
        realtimeArrivalList: realtimeArrivalListList
    );
  }
}

class ErrorMessage {
  ErrorMessage({
    this.status,
    this.code,
    this.message,
    this.link,
    this.developerMessage,
    this.total,
  });

  int? status;
  String? code;
  String? message;
  String? link;
  String? developerMessage;
  int? total;

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    link: json["link"],
    developerMessage: json["developerMessage"],
    total: json["total"],
  );


}

class RealtimeArrivalList {
  RealtimeArrivalList({
    this.beginRow,
    this.endRow,
    this.curPage,
    this.pageRow,
    this.totalCount,
    this.rowNum,
    this.selectedCount,
    this.subwayId,
    this.subwayNm,
    this.updnLine,
    this.trainLineNm,
    this.subwayHeading,
    this.statnFid,
    this.statnTid,
    this.statnId,
    this.statnNm,
    this.trainCo,
    this.ordkey,
    this.subwayList,
    this.statnList,
    this.btrainSttus,
    this.barvlDt,
    this.btrainNo,
    this.bstatnId,
    this.bstatnNm,
    this.recptnDt,
    this.arvlMsg2,
    this.arvlMsg3,
    this.arvlCd,
  });

  dynamic beginRow;
  dynamic endRow;
  dynamic curPage;
  dynamic pageRow;
  int? totalCount;
  int? rowNum;
  int? selectedCount;
  String? subwayId;
  dynamic subwayNm;
  String? updnLine;
  String? trainLineNm;
  String? subwayHeading;
  String? statnFid;
  String? statnTid;
  String? statnId;
  String? statnNm;
  dynamic trainCo;
  String? ordkey;
  String? subwayList;
  String? statnList;
  String? btrainSttus;
  String? barvlDt;
  String? btrainNo;
  String? bstatnId;
  String? bstatnNm;
  DateTime? recptnDt;
  String? arvlMsg2;
  String? arvlMsg3;
  String? arvlCd;

  factory RealtimeArrivalList.fromJson(Map<String, dynamic> json) => RealtimeArrivalList(
    beginRow: json["beginRow"],
    endRow: json["endRow"],
    curPage: json["curPage"],
    pageRow: json["pageRow"],
    totalCount: json["totalCount"],
    rowNum: json["rowNum"],
    selectedCount: json["selectedCount"],
    subwayId: json["subwayId"],
    subwayNm: json["subwayNm"],
    updnLine: json["updnLine"],
    trainLineNm: json["trainLineNm"],
    subwayHeading: json["subwayHeading"],
    statnFid: json["statnFid"],
    statnTid: json["statnTid"],
    statnId: json["statnId"],
    statnNm: json["statnNm"],
    trainCo: json["trainCo"],
    ordkey: json["ordkey"],
    subwayList: json["subwayList"],
    statnList: json["statnList"],
    btrainSttus: json["btrainSttus"],
    barvlDt: json["barvlDt"],
    btrainNo: json["btrainNo"],
    bstatnId: json["bstatnId"],
    bstatnNm: json["bstatnNm"],
    recptnDt: DateTime.parse(json["recptnDt"]),
    arvlMsg2: json["arvlMsg2"],
    arvlMsg3: json["arvlMsg3"],
    arvlCd: json["arvlCd"],
  );
}