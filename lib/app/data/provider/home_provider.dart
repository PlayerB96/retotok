import 'package:get/get.dart';

const baseUrl = 'http://10.0.2.2:8000';

class HomeProvider extends GetConnect {
  Future<Response> getDataUser(
    int idUser,
  ) async {
    try {
      final raw = await get("$baseUrl/api/users/$idUser")
          .timeout(const Duration(milliseconds: 8000));
      return raw;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }

  Future<Response> getChallengesList() async {
    try {
      final raw = await get("$baseUrl/api/challenges/")
          .timeout(const Duration(milliseconds: 8000));
      return raw;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
