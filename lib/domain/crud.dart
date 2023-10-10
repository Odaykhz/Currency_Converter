import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CRUD {
  CRUD() {
    dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }
  String? body1;
  late Dio dio;

  Future<Response> create({
    required String url,
    required Function action,
    Map<String, dynamic>? body,
  }) async {
    try {
      if (body != null) body1 = json.encode(body);
      final response = await dio.post(
        url,
        data: body1,
      );
      if (response.statusCode == 200) {
        action();
      }
      debugPrint(response.statusCode.toString());
      return response;
    } catch (e) {
      throw Exception();
    }
  }

  Future<Response> read({
    required String url,
    required Function action,
  }) async {
    try {
      final response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        action();
      }
      debugPrint(response.statusCode.toString());
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}
