import 'dart:convert';
import 'package:flutter_application_1/model/User_Model.dart';
import 'package:http/http.dart' as http;

getUser()async{
  var userData = [];
  var baseUrl = 'https://jsonplaceholder.typicode.com/users';
  var  url = Uri.parse(baseUrl);
  var res = await http.get(url);
  if(res.statusCode == 200){
    var jsonRes = jsonDecode(res.body);
    for (var i in jsonRes) {
      userData.add(User_Model.fromJson(i));
    }
      return userData;
  }
}