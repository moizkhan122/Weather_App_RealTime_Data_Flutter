import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';


class WeatherCityInfo extends StatefulWidget {
  const WeatherCityInfo({super.key,required this.cityName});

  final cityName;

  @override
  State<WeatherCityInfo> createState() => _WeatherCityInfoState();
}

class _WeatherCityInfoState extends State<WeatherCityInfo> {
    getWeatherCityInfoComplete()async{
  var baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityName.toString()}&appid=f5783e1fee68d6228723ecc46804ee40';
  var  url = Uri.parse(baseUrl);
  var res = await http.get(url);
    var jsonRes = jsonDecode(res.body);
      return jsonRes;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                            BoxShadow(
                              color: Colors.white, // Change color of the shadow
                              blurRadius: 15.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0, 5.0)
                            )
                          ],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                  color: Colors.blue),
                height: MediaQuery.of(context).size.height*0.53,
                width: MediaQuery.of(context).size.width,
              ),
              FutureBuilder(
                future: getWeatherCityInfoComplete(),
                builder: (context,AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            icon: Icon(Icons.arrow_back_ios_rounded,size: 25,color: Colors.white,)),
                            Text("All Information",style: TextStyle(fontSize: 23,color: Colors.white),),
                            Icon(Icons.wrap_text_sharp,size: 25,color: Colors.white,)
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Center(child: LottieBuilder.network("https://assets3.lottiefiles.com/packages/lf20_mhlhglws.json",fit: BoxFit.cover,width: 230,height: 230,)),
                          Column(
                            children: [
                              Text(snapshot.data["name"].toString(),style: TextStyle(fontSize: 25,color: Colors.white),),
                              Row(
                                children: [
                                  Text("Degree : ",style: TextStyle(fontSize: 20,color: Colors.white),),
                                  Text(snapshot.data["wind"]["deg"].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text("SunRise :",style: TextStyle(fontSize: 18,color: Colors.white),),
                                  Text(snapshot.data["sys"]["sunrise"].toString(),style: TextStyle(fontSize: 15,color: Colors.white),),
                                ],
                              ),
                            ],
                          )
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
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
                           SizedBox(height: 12,),
                           Container(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            //color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("coord",style: TextStyle(fontSize: 20,color: Colors.white),),
                                            SizedBox(height: 2,),
                                            Row(
                                              children: [
                                                Text("  lon ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["coord"]["lon"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("  lat ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["coord"]["lat"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                          ],),
                                      ),
                                      Container(
                                        height: 130,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Weather",style: TextStyle(fontSize: 20,color: Colors.white),),
                                            SizedBox(height: 2,),
                                            Row(
                                              children: [
                                                Text("   id ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["weather"][0]["id"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("   main ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["weather"][0]["main"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("   descreption ".toString(),style: TextStyle(fontSize: 16,color: Colors.white),),
                                                Text(snapshot.data["weather"][0]["description"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("   Icon ".toString(),style: TextStyle(fontSize: 16,color: Colors.white),),
                                                Text(snapshot.data["weather"][0]["icon"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                          ],),
                                      )
                                    ],),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                        height: 100,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Wind",style: TextStyle(fontSize: 20,color: Colors.white),),
                                            SizedBox(height: 2,),
                                            Row(
                                              children: [
                                                Text("  Speed ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["wind"]["speed"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("  Deg ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["wind"]["deg"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                          ],),
                                      ),
                                      Container(
                                        height: 130,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Other Info",style: TextStyle(fontSize: 20,color: Colors.white),),
                                            SizedBox(height: 2,),
                                            Row(
                                              children: [
                                                Text(" Time Zone ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["timezone"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("  Id ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["id"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("  Dt ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["dt"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                             Row(
                                              children: [
                                                Text("  Visibility ".toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                                Text(snapshot.data["visibility"].toString(),style: TextStyle(fontSize: 17,color: Colors.white),),
                                              ],
                                            ),
                                          ],),
                                      ),
                                      ],),
                
                                      SizedBox(height: 2,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(snapshot.data["name"].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                            Text(snapshot.data["sys"]["country"].toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                                          ],
                                        ),
                                      ),
                                ]),
                            ),
                            ),
                    ],),
                ),
              );
                  }else{
                    return CircularProgressIndicator(color: Colors.white,);
                  }                 
              },),
            ],)
        ]),
    );
  }
}