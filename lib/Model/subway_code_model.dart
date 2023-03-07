
import 'dart:convert';

CodeApi codeApiFromJson(String str) => CodeApi.fromJson(json.decode(str));

String codeApiToJson(CodeApi data) => json.encode(data.toJson());

class CodeApi {
  CodeApi({
    required this.searchInfoBySubwayNameService,
  });

  SearchInfoBySubwayNameService searchInfoBySubwayNameService;

  factory CodeApi.fromJson(Map<String, dynamic> json) => CodeApi(
    searchInfoBySubwayNameService: SearchInfoBySubwayNameService.fromJson(json["SearchInfoBySubwayNameService"]),
  );

  Map<String, dynamic> toJson() => {
    "SearchInfoBySubwayNameService": searchInfoBySubwayNameService.toJson(),
  };
}

class SearchInfoBySubwayNameService {
  SearchInfoBySubwayNameService({
    required this.listTotalCount,
    required this.result,
    required this.row,
  });

  int listTotalCount;
  Result result;
  List<RowC> row;

  factory SearchInfoBySubwayNameService.fromJson(Map<String, dynamic> json) => SearchInfoBySubwayNameService(
    listTotalCount: json["list_total_count"],
    result: Result.fromJson(json["RESULT"]),
    row: List<RowC>.from(json["row"].map((x) => RowC.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list_total_count": listTotalCount,
    "RESULT": result.toJson(),
    "row": List<dynamic>.from(row.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    code: json["CODE"],
    message: json["MESSAGE"],
  );

  Map<String, dynamic> toJson() => {
    "CODE": code,
    "MESSAGE": message,
  };
}

class RowC {
  RowC({
    required this.stationCd,
    required this.stationNm,
    required this.lineNum,
    required this.frCode,
  });

  String stationCd;
  String stationNm;
  String lineNum;
  String frCode;

  factory RowC.fromJson(Map<String, dynamic> json) => RowC(
    stationCd: json["STATION_CD"],
    stationNm: json["STATION_NM"],
    lineNum: json["LINE_NUM"],
    frCode: json["FR_CODE"],
  );

  Map<String, dynamic> toJson() => {
    "STATION_CD": stationCd,
    "STATION_NM": stationNm,
    "LINE_NUM": lineNum,
    "FR_CODE": frCode,
  };
}
