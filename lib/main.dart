import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login1/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gerege-Devita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
      ],
    );
  }
}
