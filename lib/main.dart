import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login1/pages/loginpage.dart';
import 'package:login1/pages/homepage.dart';
import 'package:login1/pages/splash.dart';

void main() {
  runApp(MyApp());
}

// Widget cpage = LoginPage();
// @override
// Future<void> onInit() async {
//   late SharedPreferences sharedPreferences;
//   sharedPreferences = await SharedPreferences.getInstance();
//   (sharedPreferences.getString("token") == null)
//       ? cpage = LoginPage()
//       : cpage = MyHomePage();
// }

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
      home: Splash(),
      // LoginPage(),
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/MyHomePage", page: () => MyHomePage()),
        GetPage(name: "/splash", page: () => Splash()),
      ],
    );
  }
}
