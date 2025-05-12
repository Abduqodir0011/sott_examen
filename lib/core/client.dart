import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://192.168.8.90:8888/api/v1'),
  );

  Future<List<dynamic>> fetchProducts() async {
    var response = await dio.get('/real-estates');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("Xatoo!");
    }
  }
}