// import 'dart:io';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../model/login_model.dart';

// // class APIService {
// //   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
// //     String url = "https://devita-demo.gerege.mn/auth/login";
// //     final response = await http.post(url, body: requestModel.toJson());

// //     if (response.statusCode == 200 || response.statusCode == 400) {
// //       return LoginResponseModel.fromJson(
// //         json.decode(response.body),
// //       );
// //     } else {
// //       throw Exception('Failed to load data!');
// //     }
// //   }
// // }

// // class APIService {
// //   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
// //     final response = await http.post(
// //       Uri.parse('https://devita-demo.gerege.mn/auth/login'),
// //       // Send authorization headers to the backend.
// //       headers: {
// //         HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
// //       },
// //     );
// //     // final responseJson = jsonDecode(response.body);
// //     // return LoginResponseModel.fromJson(responseJson);

// //     if (response.statusCode == 200 /*|| response.statusCode == 400*/) {
// //       return LoginResponseModel.fromJson(
// //         json.decode(response.body),
// //       );
// //     } else {
// //       throw Exception('Failed to load data!');
// //     }
// //   }
// // }