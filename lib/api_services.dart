import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiServices{

  final String apikey="faf559dbf83f46cbba809db5bc1ccd0e";
  Future<dynamic> getapiwithoutmodel(String city) async{
    try{
      var url=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric");
      var response=await http.get(url);

      if(response.statusCode==200){
        final data=jsonDecode(response.body);
        return data;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
}