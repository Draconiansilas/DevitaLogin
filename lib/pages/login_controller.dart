import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login1/model/login_model.dart';
// import 'package:login1/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  // UserModel? userData;

  late final UserModelData userModelData;

  String a = '';

  String get gSuccess => 'null';

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.onInit();
  }

  void loginUser() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    var bodyData = {
      "email": emailTextController?.text,
      "password": passwordTextController?.text,
    };

    print('login body data deviceToken check');
    print(bodyData);

    String url = 'https://devita-demo.gerege.mn/auth/login';
    final response = await http.post(
      Uri.parse(url),
      body: bodyData,
    );

    var res = json.decode(response.body);
    if (res['code'] == 200) {
      // userData = UserModel.fromJson(res);
      userModelData = UserModelData(
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
      Get.toNamed('/MyHomePage');
      final SharedPreferences inf = await SharedPreferences.getInstance();
      inf.setString('userInformation', jsonEncode(res['result']));

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', res['result']['token']['token']);
    } else {
      Get.back();
      Get.snackbar(
        gSuccess,
        // 'hi',
        res['message'],
        colorText: Colors.white,
      );
    }
    // @override
    // void onClose() {
    //   emailTextController?.dispose();
    //   passwordTextController?.dispose();

    //   super.onClose();
    // }

    // clean() {
    //   emailTextController?.text = '';
    //   passwordTextController?.text = '';
    // }
  }
}
