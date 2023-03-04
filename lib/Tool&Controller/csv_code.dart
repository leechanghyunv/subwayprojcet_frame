
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'getx_convert.dart';

class get_code extends GetxController {

  final Convert_digit = Get.put(Inter_Changer());
  String CodeResult = '';
  int Code = 0;

  List<List<dynamic>> data = [];

  void loadCSV(String subway, String line) async {
    final _rowData = await rootBundle.loadString("asseets/subwaycode.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(_rowData);
    data = _listData;
    find_subway_Code(data,subway,line);
  }

  void find_subway_Code(List<dynamic> csvlist, String name, String Line) {
    final index = csvlist.indexWhere((element) => element[0] == name && element[2] == Line);

    Code = csvlist[index][1];
    Line = csvlist[index][2];
    CodeResult = Convert_digit.getcode(Code);
  }

}