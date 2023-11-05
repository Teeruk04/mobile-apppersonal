// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:apppersonel/constants/api.dart';
import 'package:apppersonel/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;

  static final _dio = Dio()
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      options.baseUrl = API.BASE_URL;
      options.headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      // e.error = 'การเชื่อมต่อผิดพลาด';
      return handler.next(e);
    }));

  Future<String> login(User user) async {
    // ignore: prefer_const_declarations
    final url = API.LOGIN;
    FormData data = FormData.fromMap({
      'Email': user.Email,
      'Password': user.Password,
    });
    String msg;
    String token;
    try {
      final Response  response = await _dio.post(url, data: data);
      msg = response.data["msg"];
      token = response.data["token"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      getByToken();
    } catch (e) {
      msg = "Unauthorized";
    }
    return msg;
  }

  Future<String> getByToken() async {
    const url = API.GetToken;

    String msg = "";
    String user;
    try {
      final Response response = await _dio.get(url);
      user = response.toString();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', user);
      print(response);
    } catch (e) {
      print(e);
      msg = "Unauthorized1";
    }
    return msg;
  }

  
}
