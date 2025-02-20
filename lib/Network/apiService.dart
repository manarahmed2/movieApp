import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();
  final String baseUrl = "https://api.themoviedb.org/3/";

  Future<Map<String, dynamic>> getTrending({required String endPoint}) async {
    try {
      Response response = await dio.get("$baseUrl$endPoint");

   
      if (response.data == null || response.data.isEmpty) {
        throw Exception("Empty response from API");
      }

      return response.data;
    } catch (e) {
      print("API Error: $e");
      return {}; // ✅ إرجاع كائن فارغ بدلاً من `null`
    }
  }
}
