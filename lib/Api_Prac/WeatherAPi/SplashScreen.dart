import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Api_Prac/WeatherAPi/WeatherCity.dart';
import 'package:lottie/lottie.dart';


class WeatherSplash extends StatefulWidget {
  const WeatherSplash({super.key});

  @override
  State<WeatherSplash> createState() => _WeatherSplashState();
}

class _WeatherSplashState extends State<WeatherSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5), () => 
      Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherCity(),)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Weather App",style: TextStyle(fontSize: 45,color: Colors.white),),
              Text("All Cities",style: TextStyle(fontSize: 35,color: Colors.white),),
              Center(child: Lottie.network("https://assets5.lottiefiles.com/private_files/lf30_awyi7kl8.json")),
             SizedBox(height: 10,),
             Text("CheckOut Weather =>",style: TextStyle(fontSize: 30,color: Colors.white),),
            ]),
    );
  }
}