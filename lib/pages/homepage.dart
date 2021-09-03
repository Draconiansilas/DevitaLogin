import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login1/model/login_model.dart';
import '../pages/login_controller.dart';
import '../pages/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginController _loginController = Get.put(LoginController());
  LoginController _loginControllerFind = Get.find();

  @override
  void initState() {
    inf();
    super.initState();
  }

  @override
  Future<void> inf() async {
    late SharedPreferences inf;
    inf = await SharedPreferences.getInstance();
    var res = json.decode(json.encode(inf.getString('userInformation')));
    print('shalglasjdisadjiasdjasi');
    print(res);
    _loginController.userModelData = UserModelData(
      res['result']['_id'],
      res['result']['email'],
      res['result']['phone'],
      res['result']['password'],
      res['result']['firstName'],
      res['result']['lastName'],
      res['result']['provider'],
      res['result']['picture'],
      res['result']['googleId'],
      res['result']['facebookId'],
      res['result']['createdAt'],
      res['result']['updatedAt'],
      res['result']['status'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 50, left: 50, top: 10),
          child: Column(
            children: [
              Image(height: 80, image: AssetImage('assets/devita.png')),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.network(_loginControllerFind.userModelData.picture),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _loginControllerFind.userModelData.lastName +
                        _loginControllerFind.userModelData.firstName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.preview_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    _loginControllerFind.userModelData.provider +
                        ' ID:  ' +
                        _loginControllerFind.userModelData.googleId,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    'ID : ' + _loginControllerFind.userModelData.id,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  Text(
                    _loginControllerFind.userModelData.email,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  Text(
                    _loginControllerFind.userModelData.phone,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  print(sharedPreferences.getString("token"));

                  await sharedPreferences.clear();
                  print(sharedPreferences.getString("token"));
                  SharedPreferences inf = await SharedPreferences.getInstance();
                  print(inf);
                  await inf.remove('userInformation');
                  Get.offAll(LoginPage());
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => LoginPage()),
                  //     (Route<dynamic> route) => false);
                },

                // sharedPreferences.clear();
                // // sharedPreferences.commit();
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => LoginPage()),
                //     (Route<dynamic> route) => false);

                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff3a5fa9), Color(0xff47b787)],
                        begin: Alignment(-1, 1),
                        end: Alignment(1, -1),
                      ),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(maxWidth: 120, minHeight: 25.0),
                    alignment: Alignment.center,
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
