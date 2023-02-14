import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/getUser.dart';
import 'package:flutter_application_1/Api_Prac/UserInfo/userInfo.dart';
import 'package:flutter_application_1/model/User_Model.dart';


class Home_User extends StatefulWidget {
  const Home_User({super.key});

  @override
  State<Home_User> createState() => _Home_UserState();
}

class _Home_UserState extends State<Home_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getUser(),
          builder: (context,AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder:(context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo(userId: snapshot.data[index].id),)),
                  child: ListTile(
                    title: Text(snapshot.data[index].name),
                    subtitle:Text(snapshot.data[index].email),
                    trailing:Text(snapshot.data[index].address.street),
                  ),
                );
              },);
            }else{
              return Center(child: CircularProgressIndicator());
            }
            
          },)),
    );
  }
}