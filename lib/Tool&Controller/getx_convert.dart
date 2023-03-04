
import 'package:get/get.dart';

class Inter_Changer extends GetxController  {

  String subway_line = '';
  String line_number = '';
  String line_CVS = '';
  bool showTable = false;
  bool showtable_updown = true;

  void convertLine(int number) {
    if (number == 1) {
      subway_line = 'Line1';
    } else if (number == 2) {
      subway_line = 'Line2';
    } else if (number == 3) {
      subway_line = 'Line3';
    } else if (number == 4) {
      subway_line = 'Line4';
    } else if (number == 5) {
      subway_line = 'Line5';
    } else if (number == 6) {
      subway_line = 'Line6';
    } else if (number == 7) {
      subway_line = 'Line7';
    } else if (number == 8) {
      subway_line = 'Line8';
    } else if (number == 9) {
      subway_line = 'Line9';
    } else if (number == 10) {
      subway_line = '신분당';
    } else if (number == 11) {
      subway_line = '수인분당';
    } else if (number == 12) {
      subway_line = '경의중앙';
    }
  }

  void convertLine_to_ID(String Line) {
    if (Line == 'Line1') {
      line_number = '1001';
    } else if (Line == 'Line2') {
      line_number = '1002';
    } else if (Line == 'Line3') {
      line_number = '1003';
    } else if (Line == 'Line4') {
      line_number = '1004';
    } else if (Line == 'Line5') {
      line_number = '1005';

    } else if (Line == 'Line6') {
      line_number = '1006';
    } else if (Line == 'Line7') {
      line_number = '1007';
    } else if (Line == 'Line8') {
      line_number = '1008';
    } else if (Line == 'Line9') {
      line_number = '1009';

    } else if (Line == '신분당') {
      line_number = '1077';
    } else if (Line == '수인분당') {
      line_number = '1075';
    } else if (Line == '경의중앙') {
      line_number = '1063';
    }
  }

  void convertor(int number) {
    if (number == 0) {
       showTable = !showTable;
    } else if (number == 1) {
      showTable = !showTable;
    } else if (number == 2) {
       showTable = !showTable;
    } else {showTable = false;}
  }

  String getcode(int number) {
    String numberString = number.toString();
    int length = numberString.length;
    if (length == 3) {
      return '0' + numberString;
    } else if (length == 4) {
      return numberString;
    } else {
      throw ArgumentError('Invalid number length: $length');
    }
  }

}