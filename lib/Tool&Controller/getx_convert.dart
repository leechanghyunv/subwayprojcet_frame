import 'package:get/get.dart';

class convert extends GetxController{

  String GetxLineNumber = '';

  void convertvalue (int number){
    switch (number) {
      case 1:
        GetxLineNumber = 'Line1';
        break;
      case 2:
        GetxLineNumber = 'Line2';
        break;
      case 3:
        GetxLineNumber = 'Line3';
        break;
      case 4:
        GetxLineNumber = 'Line4';
        break;
      case 5:
        GetxLineNumber = 'Line5';
        break;
      case 6:
        GetxLineNumber = 'Line6';
        break;
      case 7:
        GetxLineNumber = 'Line7';
        break;
      case 8:
        GetxLineNumber = 'Line8';
        break;
      case 9:
        GetxLineNumber = 'Line9';
        break;
      case 10:
        GetxLineNumber = '신분당';
        break;
      case 11:
        GetxLineNumber = '수인분당';
        break;
      default:
        GetxLineNumber = '경의중앙';
    }
  }



}