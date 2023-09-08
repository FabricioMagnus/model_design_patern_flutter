import 'package:dio/dio.dart';
import 'package:model_design_patern_flutter/services/api.dart';

class VendedoresApi {
  late Dio dio;

  VendedoresApi(String token) : dio = Api.dio {
    Api.initialize(token);
  }

  Future<List<dynamic>> getSellersApi(String search) async {
    var response = await dio
        .get('/Representante/Vendedor?Page=${1}&RecordsPerPage=${10000}&search=$search');
    return response.data;
  }
}
