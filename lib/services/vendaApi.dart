import 'package:dio/dio.dart';
import 'package:model_design_patern_flutter/services/api.dart';

class VendaApi {
  late Dio dio;

  VendaApi(String token) : dio = Api.dio {
    Api.initialize(token);
  }

  Future<List> getQuantitySales() async {
    var response = await dio
        .get('/Vendas?Page=${1}&RecordsPerPage=${10000}');
    return response.data;
  }
}
