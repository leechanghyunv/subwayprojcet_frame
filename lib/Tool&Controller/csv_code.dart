import 'package:get/get.dart';
import '../Model/subway_code_model.dart';
import 'getx_convert.dart';
import 'package:http/http.dart' as http;

class get_code extends GetxController {

  String? key = '4c6f72784b6272613735677166456d';

  final Convert_digit = Get.put(Inter_Changer());
  String CodeResult = '';
  String Converted_line = '';
  late List<RowC> codedata = [];

Future<CodeApi?> Get_code(String name, String lineC) async {
  Convert_digit.convertLine2(lineC);
  Converted_line = Convert_digit.line_number_API;
  try{
    var response = await http.get(Uri.parse(
        'http://openapi.seoul.go.kr:8088/${key}/json/SearchInfoBySubwayNameService/1/5/${name}/'));
    var codevalue = codeApiFromJson(response.body);
      codedata = codevalue.searchInfoBySubwayNameService.row;
      final index = codedata.indexWhere((element) => element.lineNum == Converted_line);
      CodeResult = codedata[index].stationCd;
      print('지하철 코드는 ${CodeResult}');
  }catch(e){
    print('Error occured!@!@!');
  }
  return null;
}


}