import 'dart:convert';
import 'package:flutter_application_1/model/WeatherCompleteDataModel.dart';
import 'package:http/http.dart' as http;

// getWeatherCityInfo(String city)async{
//   var WeatherData = [];
//   var baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q={$city}i&appid=f5783e1fee68d6228723ecc46804ee40';
//   var  url = Uri.parse(baseUrl);
//   var res = await http.get(url);
//   if(res.statusCode == 200){
//     var jsonRes = jsonDecode(res.body);
//     for (var i in jsonRes) {
//       WeatherData.add(WeatherDataModel.fromJson(i));
//     }
//       return WeatherData;
//   }
// }

  