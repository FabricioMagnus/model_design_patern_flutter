import 'package:dio/dio.dart';

class LoginApi {
  final dio = Dio();

  Future login(Map<String, dynamic> body) async {
    await dio.post('https://amvendas.softkuka.com.br/api/login', data: body);
  }
}
