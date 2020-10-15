import 'package:dio/dio.dart';
import 'package:flutter_dio/shared/constants.dart';
import 'package:flutter_dio/shared/custom_dio/interceptors.dart';

class CustomDio {
  final Dio dio;

  CustomDio(this.dio) {
    dio.options.baseUrl = BASE_URL;
    dio.options.connectTimeout = 5000;
    dio.interceptors.add(CustomInterceptors());
  }
}
