import 'package:dio/dio.dart';

class LoginApi {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://amvendas.softkuka.com.br/api',
    )
  );

  Future<String> login(Map<String, dynamic> body) async {
    Response response = await dio.post('https://amvendas.softkuka.com.br/api/login', data: body);
    return response.data.toString();
  }
}
