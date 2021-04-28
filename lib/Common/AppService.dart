import 'dart:convert';

import 'package:dio/dio.dart';

import 'AppClass.dart';

Dio dio = new Dio();

class AppServices {
  static Future<DataClass> AccessToken(String username, String password) async {
    String url =
        "https://origin.opicxo.com/token?username=$username&password=$password";
    print("Get Login with otp  URL: " + url);
    try {
      final response = await dio.get(url,
          options: Options(
            method: 'POST',
            responseType: ResponseType.plain,
          ));
      if (response.statusCode == 200) {
        DataClass dataClass = new DataClass(message: 'No Data', value: "1");
        final jsonResponse = json.decode(response.data);
        // dataClass.message = jsonResponse['message'];
        // dataClass.value = jsonResponse['status'].toString();
        // dataClass.statusCode = jsonResponse['responseCode'].toString();
        dataClass.access_token = jsonResponse['access_token'].toString();
        // dataClass.otp = jsonResponse['otp'].toString();
        print("Login with otp Responce: ${jsonResponse}");
        return dataClass;
      } else {
        throw Exception("Something went Wrong");
      }
    } catch (e) {
      print("Login Error : " + e.toString());
      throw Exception("Something went wrong");
    }
  }

  static Future<DataClass> LoginApp(
      String email, String password, String token) async {
    String url =
        "https://origin.opicxo.com/api/v1/login?email=$email&password=$password";
    print("Get login opicxo   URL: " + url);
    try {
      print("11");
      final response = await dio.post(url,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      print("22"); print("${response.toString()}");
      if (response.statusCode == 200) {
        print("33");
        print("${response.data}");
        DataClass dataClass = new DataClass(message: 'No Data', value: null);
        final jsonResponse = response.data;
        print("${jsonResponse.toString()}");
        print("list Responce: ${jsonResponse}");
        List list = [];
        list = [
          {
            "first_name": jsonResponse['login_response']["first_name"],
            "last_name": jsonResponse['login_response']["last_name"],
            "user_name": jsonResponse['login_response']["user_name"],
            "email": jsonResponse['login_response']["email"],
            "customer_token": jsonResponse['login_response']["customer_token"],
          }
        ];

        dataClass.login_response = list;
        print("opicxo login Responce: ${jsonResponse}");
        return dataClass;
      } else {
        throw Exception("Something went Wrong");
      }
    } catch (e) {
      print("logout Error : " + e.toString());
      throw Exception("Something went wrong");
    }
  }

  static Future<DataClass> AboutUs(String token) async {
    String url =
        "https://origin.opicxo.com/api/v1/studios/55/description";
    print("Get about opicxo   URL: " + url);
    try {
      print("11");
      final response = await dio.get(url,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      print("22"); print("${response.toString()}");
      if (response.statusCode == 200) {
        print("33");
        print("${response.data}");
        DataClass dataClass = new DataClass(message: 'No Data', value: null);
        final jsonResponse = response.data;
        print("${jsonResponse.toString()}");
        print("list Responce: ${jsonResponse}");
        List list = [];
        list = [
          {
            "description": jsonResponse['studio']["description"],
          }
        ];

        dataClass.studio = list;
        print("opicxo about Responce: ${jsonResponse}");
        return dataClass;
      } else {
        throw Exception("Something went Wrong");
      }
    } catch (e) {
      print("about Error : " + e.toString());
      throw Exception("Something went wrong");
    }
  }
}
