import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/auth_models.dart';

class ApiServices {
  SharedPreferences? prefs;
  ApiServices({this.prefs});
  Future<int?> signinPostRequest(LoginModel model) async {
    String endPoint =
        'https://graduation-api-zaj9.onrender.com/api/v1/user/login';
    Response response;
    try {
      Dio dio = Dio();
      response = await dio.post(
        endPoint,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        print('Successful Response');
        print('Response: ${response.data}');

        String accessToken = response.data['token'];
        String refreshToken = response.data['refresh_token'];

        prefs?.setString('accessToken', accessToken);
        prefs?.setString('refreshToken', refreshToken);

        print('Access Token: $accessToken');
        print('Refresh Token: $refreshToken');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<int?> signupPostRequest(SignupModel model) async {
    String endPoint =
        'https://graduation-api-zaj9.onrender.com/api/v1/user/register';
    Response response;
    try {
      Dio dio = Dio();
      response = await dio.post(
        endPoint,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        print('Successful Response');
        print('Response: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<int?> forgetPasswordPostRequest(ForgetPasswordModel model) async {
    String endPoint =
        'https://graduation-api-zaj9.onrender.com/api/v1/user/forget-password';
    Response response;
    try {
      Dio dio = Dio();
      response = await dio.post(
        endPoint,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        print('Successful Response');
        print('Response: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<int?> resetPasswordPostRequest(ResetPasswordModel model) async {
    String endPoint =
        'https://graduation-api-zaj9.onrender.com/api/v1/user/reset-password';
    Response response;
    try {
      Dio dio = Dio();
      response = await dio.post(
        endPoint,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        print('Successful Response');
        print('Response: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<int?> userLogoutPostRequest(SharedPreferences prefs) async {
    String endPoint =
        'https://graduation-api-zaj9.onrender.com/api/v1/user/logout';
    Response response;
    try {
      Dio dio = Dio();
      UserLogoutModel logoutModel = UserLogoutModel.fromAccessToken(prefs);
      response = await dio.post(
        endPoint,
        data: logoutModel.toJson(),
      );
      if (response.statusCode == 200) {
        print('Successful Response');
        print('Response: ${response.data}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}


// class LoginService {
//   final Dio _dio = Dio();

//   Future<LoginModel> signIn() async {
//     try {
//       Response response = await _dio.post('$baseUrl/user/login',data: {});
//       if (response.statusCode == 200) {
//         return LoginModel.fromJson(json.decode(response.data));
//       } else {
//         throw Exception('Failed to sign in');
//       }
//     } catch (error) {
//       throw Exception('Failed to sign in: $error');
//     }
//   }
// }

// import '../models/login_model.dart';
// import '../web_services/login_service.dart';

// class LoginRepository {
//   final LoginService _loginService = LoginService();

//   Future<LoginModel> signIn() async {
//     try {
//       LoginModel response = await _loginService.signIn();
//       return response;
//     } catch (error) {
//       throw Exception('Failed to sign in: $error');
//     }
//   }
// }


// options: Options(
//   headers: {
//     'Content-Type': 'application/json', // Set content type header
//   },
// ),