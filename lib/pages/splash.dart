import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login1/pages/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

// late var tok;

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    goroute();
    super.initState();
  }

  @override
  Future<void> goroute() async {
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    final SharedPreferences inf = await SharedPreferences.getInstance();
    Timer(
      Duration(seconds: 3),
      () => (sharedPreferences.getString("token") == null)
          ? Get.to(LoginPage())
          : Get.to(MyHomePage())  
          // 
    );
    print(sharedPreferences.getString("token"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
