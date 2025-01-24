import 'dart:io';

import 'package:dio/dio.dart';

const accessKey = '8TbkAYD1arUiCDNoGe4Kc5GPQDOAmCJ0krZ6dhYceEk';
const baseUrl = 'https://api.unsplash.com/';

class ApiProvider {
  Dio get dio => _dio();

  Dio _dio() {
    var dio = Dio(configureDio());
    return dio;
  }

  BaseOptions configureDio() {
    final options = BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          HttpHeaders.authorizationHeader: 'Client-ID $accessKey',
        });
    return options;
  }
}
