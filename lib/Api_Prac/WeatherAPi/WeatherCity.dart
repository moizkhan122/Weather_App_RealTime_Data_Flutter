import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Api_Prac/WeatherAPi/WeatherCityInfo.dart';
import 'package:flutter_application_1/Controller/getWeatherCity.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class WeatherCity extends StatefulWidget {
  const WeatherCity({super.key});

  @override
  State<WeatherCity> createState() => _WeatherCityState();
}

class _WeatherCityState extends State<WeatherCity> {

  Map name = {
    'name' : "moiz",
      "subjects" : {"eng" :12, "urdu" : 23},
  };
    final searchCity = TextEditingController();
  getWeatherCityInfo()async{
  var baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q=${searchCity.text.toLowerCase().toString()}&appid=f5783e1fee68d6228723ecc46804ee40';
  var  url = Uri.parse(baseUrl);
  var res = await http.get(url);
    var jsonRes = jsonDecode(res.body);
    print("Data......");
    print(jsonRes);
      return jsonRes;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Text((name["subjects"]["eng"]).toString()),
              Container(
                height: MediaQuery.of(context).size.height*0.86,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                            BoxShadow(
                              color: Colors.white, // Change color of the shadow
                              blurRadius: 15.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0, 5.0)
                            )
                          ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                      child: TextFormField(
                        controller: searchCity,
                        onChanged: (value) {
                          setState(() {
                            
                          });
                        },
                        
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: "Search City",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                                  future: getWeatherCityInfo(),
                                  builder: (context,AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if(searchCity.text.isEmpty){
                                    return Center(child: LottieBuilder.network("https://assets2.lottiefiles.com/packages/lf20_cdapnd1k.json"));
                                  }
                                  else
                                  {
                                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60,),
                        Text(snapshot.data["name"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,color: Colors.white),),
                        Text("heavy Rain To-Night",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.white),),
                          Center(
                            child: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_xzgLBZ.json",height: 280,alignment: Alignment.topCenter),),
                          
                          Text("___________________________________________________________",style: TextStyle(color: Colors.white.withOpacity(0.7)),),
                         SizedBox(height: 10,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Container(
                              height: 80,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(color: Colors.white,width: 2),
                                borderRadius: BorderRadius.circular(20)),
                               child: Column(
                                children: [
                                  Icon(Icons.speed),
                                  Text("Temp",style: TextStyle(fontSize: 18,color: Colors.white),),
                                  SizedBox(height: 3,),
                                  Text(snapshot.data["main"]["temp"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                ],
                               ),
                             ),
                             Container(
                              height: 80,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(color: Colors.white,width: 2),
                                borderRadius: BorderRadius.circular(20)),
                               child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.speed),
                                  Text("temp_min",style: TextStyle(fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text(snapshot.data["main"]["temp_min"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                ],
                               ),
                             ),
                             Container(
                              height: 80,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(color: Colors.white,width: 2),
                                borderRadius: BorderRadius.circular(20)),
                               child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.speed),
                                  Text("temp_min",style: TextStyle(fontSize: 14,color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text(snapshot.data["main"]["temp_max"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                ],
                               ),
                             ),
                           ],
                         ),
                         
                           Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,color: Colors.white),),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherCityInfo(cityName: snapshot.data["name"].toString()),));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white)),
                                    child: Center(
                                      child: Text("More Info.!",
                                                              style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,color: Colors.white),),
                                    ),
                                  ),
                                ),
                  ],
                ),
              ),         
                                ],);
                                  }
                                }else{
                                  return CircularProgressIndicator();
                                }
                                //print(snapshot.data.toString());
                                
                                  },),
                    ),
                    SizedBox(height: 20,),
                    
                  ],
                ),
              ),
              SizedBox(height: 15,),
              
            ],
          ),
        )),
    );
  }
}