import 'package:dio/dio.dart';

class Apiservice {
  final dio = Dio();
  final baseUrl = "https://api.themoviedb.org/3/";
  Future<Map<String, dynamic>> getTrending({required String endPoint}) async {
    Response response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
