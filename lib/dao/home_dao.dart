
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trip_app/model/home_model.dart';


const HOME_URL = 'http://13.76.178.179/tripjson/home_page.json';
class HomeDao{
    static Future<HomeModel> fetch() async{
        final response = await http.get(HOME_URL);
        if(response.statusCode == 200){
          Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
          var result  = json.decode(utf8decoder.convert(response.bodyBytes));
          return HomeModel.fromJson(result);
        }
        else{
          throw Exception('Failed to load home page json');
        }
    }
}