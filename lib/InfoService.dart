import 'package:dio/dio.dart';
import 'Info.dart';

class InfoService {
  Dio dio = Dio();

  Future<List<Info>> getInfo() async {
    Response strRes = await dio.get('https://agrichapp.herokuapp.com/members');
    
    if(strRes.statusCode == 200) {
      List<dynamic> result = strRes.data;
      List<Info> resultJson = result.map((json) {
        return Info.fromJson(json);
      }).toList();
      return resultJson;
    } else {
      throw Exception('Failed');
    }
  }
}