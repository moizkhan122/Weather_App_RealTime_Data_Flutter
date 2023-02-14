import 'dart:convert';
import 'package:flutter_application_1/model/singleUserDataModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/User_Model.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.userId});

  getUserInfo()async{
  var userData = [];
  var baseUrl = 'https://jsonplaceholder.typicode.com/users/$userId';
  var  url = Uri.parse(baseUrl);
  var res = await http.get(url);
  if(res.statusCode == 200){
    var jsonRes = jsonDecode(res.body);
    var data = Single_User_Model.fromJson(jsonRes);
    print(jsonRes);
      return data;
  }
}
  final userId;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: getUserInfo(),
          builder: (context,AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return SafeArea(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    width: double.infinity,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("User Data",style: TextStyle(fontSize: 35,color: Colors.black),)),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("User Id",style: TextStyle(fontSize: 20,color: Colors.black)),
                              Text(snapshot.data.id.toString(),style: TextStyle(fontSize: 20,color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("User Name",style: TextStyle(fontSize: 20,color: Colors.black)),
                              Text(snapshot.data.name.toString(),style: TextStyle(fontSize: 20,color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("User Username",style: TextStyle(fontSize: 20,color: Colors.black)),
                              Text(snapshot.data.username.toString(),style: TextStyle(fontSize: 20,color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("User email",style: TextStyle(fontSize: 20,color: Colors.black)),
                              Text(snapshot.data.email.toString(),style: TextStyle(fontSize: 20,color: Colors.black)),
                            ],
                          ),
                        ],),
                    ),
                  ),
                ),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
            
          },)
    );
  }
}