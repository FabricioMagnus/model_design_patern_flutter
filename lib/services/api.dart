import 'package:dio/dio.dart';

class Api {
  final _dio = Dio();

  Dio get dio => _dio;

  Api() {
    _dio.options.baseUrl = 'https://amvendas.softkuka.com.br/api';
  }
}
