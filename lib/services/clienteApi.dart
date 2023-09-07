import 'package:dio/dio.dart';
import 'package:model_design_patern_flutter/services/api.dart';

class ClienteApi {
  late Dio dio;

  // final dio = Dio(
  //   BaseOptions(
  //     baseUrl: 'https://amvendas.softkuka.com.br/api',
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   ),
  // );

  ClienteApi(String token) : dio = Api.dio {
    Api.initialize(token);
  }
  
  Future<List<dynamic>> getQuantityClients() async {
    var response = await dio.get('/Cliente');
    return response.data;
  }
}
