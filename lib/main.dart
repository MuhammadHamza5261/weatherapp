import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathercheckapp/ui/weather_screen_1.dart';
import 'bloc/weather_bloc.dart';



void main() {
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(create: (context) => WeatherBloc()),
        ],
        child: MyApp(),
      ));

  // MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WeatherAppSTL()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
         const  SizedBox(
            height: 180,
          ),
          Center(
            child: Image.asset('assets/images/3.gif'),
          ),
          const Text('Check Weather',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


